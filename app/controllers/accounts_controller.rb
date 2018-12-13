class AccountsController < ApplicationController
  def index
    if current_user
      render :index
    else
      redirect_to signin_path
    end
  end

  def show
    @account = Account.find(params[:id])
  end
end
