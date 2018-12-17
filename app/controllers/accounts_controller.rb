require 'bip_mnemonic'

class AccountsController < ApplicationController

  before_action :authorize, only: [:show]

  def index
    if current_user
      if current_user.confirmed
        render :index
      else
        session[:words] = BipMnemonic.to_mnemonic(bits: 128).split(" ")
        @words = session[:words]
        render :seed
      end
    else
      redirect_to signin_path
    end
  end

  def new
    if current_user.confirmed
      # go to route for adding new bip0032 address parameter
      render :new
    else
    end
  end

  def restore
    session.delete(:words)
  end

  def validate
  end

  def create
    if session[:words]
      if session[:words].include?(params[:word1]) && session[:words].include?(params[:word2]) && session[:words].include?(params[:word3]) && session[:words].include?(params[:word4]) && session[:words].include?(params[:word5]) && session[:words].include?(params[:word6]) && session[:words].include?(params[:word7]) && session[:words].include?(params[:word8]) && session[:words].include?(params[:word9]) && session[:words].include?(params[:word10]) && session[:words].include?(params[:word11]) && session[:words].include?(params[:word12])
        @user = current_user
        @user.master_key = BipMnemonic.to_seed(mnemonic: session[:words].join(" "))
        @user.confirmed = true
        @user.save
        session[:words] = ""
        redirect_to user_accounts_path
      else
        flash[:alert] = "The words you entered do not match the words that we gave you. Here they are again..."
        @words = session[:words]
        render :seed
      end
    else
      word1 = params[:word1]
      word2 = params[:word2]
      word3 = params[:word3]
      word4 = params[:word4]
      word5 = params[:word5]
      word6 = params[:word6]
      word7 = params[:word7]
      word8 = params[:word8]
      word9 = params[:word9]
      word10 = params[:word10]
      word11 = params[:word11]
      word12 = params[:word12]
      mnemonic = [word1,word2,word3,word4,word5,word6,word7,word8,word9,word10,word11,word12].join(" ")

      @user = current_user
      @user.master_key = BipMnemonic.to_seed(mnemonic: mnemonic)
      @user.confirmed = true
      @user.save
      redirect_to user_accounts_path(@user)
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
