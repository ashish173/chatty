class FriendshipsController < ApplicationController
  # Create a relationship between a current user and a user
  def add_friend
    puts "In Add Friend method"
    
    redirect_to users_path
  end
end
