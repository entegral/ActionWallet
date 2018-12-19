class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def restore
    session.delete(:words)
  end

  def validate
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You've successfully signed up!"
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem signing up. Make sure that your passwords match"
      redirect_to '/signup'
    end
  end

  def update
    if session[:words]
      if session[:words].include?(params[:word1]) && session[:words].include?(params[:word2]) && session[:words].include?(params[:word3]) && session[:words].include?(params[:word4]) && session[:words].include?(params[:word5]) && session[:words].include?(params[:word6]) && session[:words].include?(params[:word7]) && session[:words].include?(params[:word8]) && session[:words].include?(params[:word9]) && session[:words].include?(params[:word10]) && session[:words].include?(params[:word11]) && session[:words].include?(params[:word12])
        mnemonic = session[:words].join(" ")

        master_key = BipMnemonic.to_seed(mnemonic: mnemonic)
        current_user.update({:master_key => master_key, :confirmed => true, :password => params[:password] })
        session[:words] = ""
        flash[:alert] = ""
        redirect_to user_path(current_user)
      else
        flash[:alert] = "The words you entered do not match the words that we gave you. Here they are again..."
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

      master_key = BipMnemonic.to_seed(mnemonic: mnemonic)
      current_user.update({:master_key => master_key, :confirmed => true, :password => params[:password] })
      session[:words] = ""
      flash[:alert] = ""
      redirect_to user_accounts_path(@user)
    end
  end

  def show
    if current_user
      if current_user.confirmed
        @wallet_ballance = 0
        current_user.accounts.each do |account|
          @wallet_ballance += account.total
        end
        @wallet_ballance.round(8)
        render :show
      else
        session[:words] = BipMnemonic.to_mnemonic(bits: 128).split(" ")
        @words = session[:words]
        render :seed
      end
    else
      redirect_to signin_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
