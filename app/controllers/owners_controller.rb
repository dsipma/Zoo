class OwnersController < ApplicationController

  def create
    @animal = Animal.find(params[:owner][:animal_id])
    if(current_user.purchase! (@animal))
      message = "You bought a #{@animal.species}"
    else
      message = "You don't have enough money to buy a #{@animal.species}"
     end
      redirect_to animals_path, :notice => message
    end

    def destroy
      @animal = Owner.find(params[:id]).animal
      current_user.sell!(@animal)
      redirect_to user_path(current_user), :notice => "Sold #{@animal.species}"
    end

end
