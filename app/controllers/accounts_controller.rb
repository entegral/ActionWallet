require 'bip_mnemonic'

class AccountsController < ApplicationController

  before_action :authorize, only: [:show]

  def new
    if current_user.confirmed
      # go to route for adding new bip0032 address parameter
      render :new
    else
    end
  end

  def create
    "Create account here"
  end

  def show
    if Account.find(params[:id]).user == current_user
      @account = current_user.accounts.find(params[:id])
    else
      redirect_to accounts_path
    end
  end
end
