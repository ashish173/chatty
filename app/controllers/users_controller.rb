class UsersController < ApplicationController
  def index
    # Show all other users except current user
    @users = User.where.not(id: current_user.id)
  end
end
