class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to user_account_path(current_user, @address.account)
    else
      flash[:alert] = "NO DICE, Can't make an address"
      redirect_to user_account_path(current_user, @address.account)
    end
  end
  private
  def address_params
    params.require(:address).permit(:username, :password, :password_confirmation)
  end
end

def show
end
