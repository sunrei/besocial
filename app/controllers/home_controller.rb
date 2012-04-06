# coding: utf-8
class HomeController < ApplicationController
  def index
    @user = current_user
    render :template => 'users/show'
  end

  def news

  end
end
