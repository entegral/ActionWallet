class AddressesController < ApplicationController
  def new
    @address = Address.new
    @account = Account.find(params[:account_id])
  end

  def create
    @account = Account.find(params[:account_id])
    parameters = address_params
    parameters[:chain_index] = 0
    parameters[:address_index] = @account.addresses.count
    @address = @account.addresses.new(parameters)
    if @address.save
      redirect_to user_account_path(current_user, @account)
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
