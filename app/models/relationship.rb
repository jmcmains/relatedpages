class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "Product"
  belongs_to :followed, class_name: "Product"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  
  def reverse
    find_by(follower_id: followed_id, followed_id: follower_id)
  end
end
