class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    parameters = params
    parameters[:chain_index] = 0
    parameters[:address_index] = @address.account.addresses.count
    @address = @address.account.addresses.new(address_params)
    if @address.save
      redirect_to user_account_path(current_user, @address.account)
    else
      flash[:alert] = "NO DICE, Can't make an address"
      redirect_to user_account_path(current_user, @address.account)
    end
  end
end
