class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :new, :create]
  before_filter :admin_user, :only => [:destroy, :index]
 
  def show
    @user = User.find(params[:id])
  end

  def index
    @title = "All users"
    @users = User.all
  end

  private
end
