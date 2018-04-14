class Post < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 5000 }
  default_scope -> {order(created_at: :desc) }
  has_many :comments, dependent: :destroy
end
