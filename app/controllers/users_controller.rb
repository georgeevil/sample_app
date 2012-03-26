class UsersController < ApplicationController

  def index
    @title = 'Users'
  end
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @title = "Sign up"
  end
end