require 'bip_mnemonic'

class AccountsController < ApplicationController

  before_action :authorize, only: [:show]

  def new
    if current_user.confirmed
      @account = Account.new
      render :new
    else
      flash[:alert] = "Please validate your seed words"
      redirect_to user_account(current_user)
    end
  end

  def create
    parameters = account_params
    parameters[:account_index] = current_user.accounts.count
    parameters[:coin] = 0
    current_user.accounts.create(parameters)
    redirect_to  user_path(current_user)
  end

  def show
    if Account.find(params[:id]).user == current_user
      @account = current_user.accounts.find(params[:id])
      @bip32_path = "m/44'/1'/#{@account.account_index}'"
    else
      redirect_to accounts_path
    end
  end

private
  def account_params
    params.require(:account).permit(:name)
  end
end
