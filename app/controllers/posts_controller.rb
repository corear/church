class PostsController < ApplicationController
    
   
    
    def new
        @post = Post.new
    end
    
    def index
        @posts = Post.all
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if params[:post][:group_id] then
           @post.groupid = params[:post][:group_id]
        end
        respond_to do |f|
            if (@post.save)
                if @post.post_type == "Announcement" then
                    if @post.groupid != nil then
                        for @u in @post.members.split(',') do
                            UserMailer.announcement(User.find(@u),@post.content,@post.id).deliver
                        end
                    end
                end
                f.html { redirect_to "/@#{current_user.username}"}
            else
                f.html { redirect_to "/@#{current_user.username}", alert: "Error: Post not saved. Most likely, you had more than 500 characters." }
            end
        end
    end
    
    def show
        @comments = Comment.where(post_id: @post).order("created_at DESC")
    end
    
    def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/home', :alert => "Your post has been deleted."
    end
    
    def upvote
        Post.find(params[:id]).upvote_by current_user
        redirect_to :back
    end
   
  
    private
    
   
    
    
    def post_params
        params.require(:post).permit(:user_id, :content, :post_type)
    end
    
    
end