class Friendship < ActiveRecord::Base
  belongs_to :user # This ads the user_id column as foreign key
  belongs_to :friend, :class_name => "User" # This ads as friend_id as the foriegn key
end

