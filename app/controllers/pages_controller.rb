class PagesController < ApplicationController
  def home
  @user = current_user
    if user_signed_in?
      redirect_to @user
    end
  end
end
