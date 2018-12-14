class AccountsController < ApplicationController
  before_action :authorize, only: [:show]

  def index
    if current_user
      render :index
    else
      redirect_to signin_path
    end
  end

  def show
    if Account.find(params[:id]).user == current_user
      @account = current_user.accounts.find(params[:id])
    else
      redirect_to accounts_path
    end
  end
end
