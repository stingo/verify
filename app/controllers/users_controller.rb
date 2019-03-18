class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :challenge, :verify, :success]
  before_action :authenticate_user!, :except => [:index, :show]


  def index

    @users = User.all
    
  end



  def new
  end

  def create
    session[:phone_number] = params[:phone_number]
    session[:country_code] = params[:country_code]
    @response = Authy::PhoneVerification.start(
      via: params[:method],
      country_code: params[:country_code],
      phone_number: params[:phone_number]
    )
    if @response.ok?
      redirect_to challenge_users_path
    else
      render :new
    end
  end

  def show
  end

  def challenge
   
  end

  def verify
   
    @response = Authy::PhoneVerification.check(
      verification_code: params[:code],
      country_code: session[:country_code],
      phone_number: session[:phone_number]
    )
    if @response.ok?
      session[:phone_number] = nil
      session[:country_code] = nil
      redirect_to success_users_path
    else
      render :challenge
    end
  end

  def success
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      #@user = User.friendly.find(params[:id])
     
     
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstname, :lastname, :displayname, :mobile_number, :email, :phone_number, :country_code )
    end



end
