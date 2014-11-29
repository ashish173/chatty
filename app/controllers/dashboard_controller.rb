class DashboardController < ApplicationController
  def index
    @users = User.all
    return nil
  end

  def fetch_friends
    render :index     
  end
end
