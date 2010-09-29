class User < ActiveRecord::Base
  class NotAuthenticated < StandardError; end

  has_many :videos
  validates :email, :uniqueness => true
end