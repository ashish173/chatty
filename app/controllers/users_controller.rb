class UsersController < ApplicationController
  def index
    # Show all other users except current user
    @users = User.where.not(id: current_user.id)

  end

  def fetch_friends
    # Fetch friends from facebook using koala
    @graph = Koala::Facebook::API.new(current_user.oauth_token)
    me = @graph.get_object("556895507", api_version: "v1.0")
    @friends = @graph.get_connections("me", "friends")
    @feed= @graph.get_connections("me", "feed")
    # User api version 1.0 to fetch freinds
    # api version > 2.0 doesn't return
    # all the friends
    # Render :nothing => true
  end
end
