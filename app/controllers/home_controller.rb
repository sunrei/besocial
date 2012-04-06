class HomeController < ApplicationController
  def index
    @user = current_user
  end

  def users
    @users = User.all
  end

  def news

  end
end
