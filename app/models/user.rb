class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # For user relationship for friends
  # Finds user's friends
  has_many :friendships
  has_many :friends, :through => :friendships

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
