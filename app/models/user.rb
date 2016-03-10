class User < ActiveRecord::Base
  validates :name, :email, :password, presence: true
  validates :name, :email, uniqueness: true
end
