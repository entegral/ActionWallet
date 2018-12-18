class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    parameters = address_params
    parameters[:chain_index] = 0
    parameters[:address_index] = 0
    parameters[:account_id] = 1
    @address = Address.new(parameters)
    if @address.save
      redirect_to user_path(current_user)
    else
      flash[:alert] = "NO DICE, Can't make an address"
      redirect_to user_path(current_user)
    end
  end

  private
  def address_params
    params.require(:address).permit(:label, :chain_index, :address_index)
  end
end
