class User < ActiveRecord::Base
  attr_accessible :email, :name
  
  has_many :posts

  validates :name,  :presence => true
  validates :email, :presence => true, :uniqueness => true
end
