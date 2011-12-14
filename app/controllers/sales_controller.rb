class SalesController < ApplicationController
   def buy
     flash[:success]= "BUY"
     redirect_to user_path(current_user)
   end

  def sell

  end
end