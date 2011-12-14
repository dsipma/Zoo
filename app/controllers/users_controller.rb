class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => :show
  before_filter :admin_user, :only => [:destroy]
 
  def show
    @user = User.find(params[:id])
  end

  def index
    @title = "All users"
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path, :notice => "User deleted."
  end
end
