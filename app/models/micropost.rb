class Micropost < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :user # associate with a User
  
  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true  
  
  # return microposts in descending order of create_at date by default
  default_scope :order => 'microposts.created_at DESC'
end
