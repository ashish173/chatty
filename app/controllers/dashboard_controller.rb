class DashboardController < ApplicationController
  def index
    @users = User.all
    return nil
  end
end
