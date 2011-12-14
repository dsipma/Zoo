class SalesController < ApplicationController
  before_filter :get_animal


  def buy

     redirect_to user_path(current_user),  :notice => @animal.species + "BUY"
   end

  def sell

    redirect_to user_path(current_user), :notice => @animal.species + " Sold"
  end

  def get_animal
    @animal = Animal.find(params[:id])
  end
end