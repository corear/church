class GroupsController < ApplicationController
    
    def new
        @group = Group.new
    end
    
    def create
        @group = Group.new(post_params)
        @group.owner = current_user.id
        @group.members = "#{current_user.id}"
        
            
            if Group.find_by_name(@group.name) then
                redirect_to "/@#{current_user.username}", alert: "Error: Group name already exists." 
            else
                
                @group.save
            current_user.groups += ",#{@group.id}"
            current_user.save
                
                redirect_to "/group/#{@group.id}"
            end
    end
    
    def join
        @groups = current_user.groups.split(',')
        
        if @groups.include?("#{params[:groupid]}") then
           redirect_to "/group/#{params[:groupid]}", :alert => "You already joined this group!" 
        else
           if current_user.groups == "" then
               current_user.groups = "#{params[:groupid]}"
           else
               current_user.groups = current_user.groups + ",#{params[:groupid]}"
           end
           
           @g = Group.find(params[:groupid])
           
           if @g.members == "" then
               @g.members = "#{current_user.id}"
           else
               @g.members = @g.members + ",#{current_user.id}"
           end
           
           if @g.owner == nil then
               @g.owner = current_user.id
           end
           
           current_user.save
           @g.save
           redirect_to "/group/#{params[:groupid]}"
        end
    end
    
    def leave
        @groups = current_user.groups.split(',')
        
        if @groups.include?("#{params[:groupid]}") then
           if current_user.groups == "#{params[:groupid]}" then
               current_user.groups = ""
           else
               @groups.delete("#{params[:groupid]}")
               current_user.groups = @groups.join(',')
           end
           
           @g = Group.find(params[:groupid])
           
           if @g.members == "#{current_user.id}" then
               @g.members = ""
           else
               @members = @g.members.split(',')
               @members.delete("#{current_user.id}")
               @g.members = @members.join(',')
           end
           
           if @g.owner == current_user.id then
               @g.owner = nil
           end
           
           current_user.save
           @g.save
           redirect_to "/home"
        else
           redirect_to "/group/#{params[:groupid]}", :alert => "You are not apart of this group!" 
        end
        
        
    end
    
    def edit
        @group = Group.find(params[:id])
    end
    
    def update
        @group = Group.find(params[:id])
        
        if @group.update_attributes(params[:group].permit(:name,:description))
            redirect_to "/group/#{@group.id}"
        end
    end
    
    def post_params
        params.require(:group).permit(:name)
    end
    
end
