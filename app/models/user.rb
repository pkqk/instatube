class User < ActiveRecord::Base
  has_many :videos
  validates :email, :uniqueness => true
end