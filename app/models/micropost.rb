class Micropost < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :user # associate with a User
  
  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true  
  
  # return microposts in descending order of create_at date by default
  default_scope :order => 'microposts.created_at DESC'
  
  # return microposts from the users being followed by the given user
  scope :from_users_followed_by, lambda { |user| followed_by(user) }
  
  
  private
  
    # Return an SQL condition fro users followed by the given user.
    # We include the user's own id as wel
    def self.followed_by(user)
      followed_ids = %(SELECT followed_id FROM relationships
                       WHERE follower_id = :user_id)
      where("user_id IN (#{followed_ids}) OR user_id = :user_id",
             { :user_id => user })
    end
end
