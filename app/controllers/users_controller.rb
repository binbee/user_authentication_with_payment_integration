class UsersController < ApplicationController
  skip_before_action :login_require, only: [:new,:create,:let_me_login,:allow_login,:facebook_login]
  def index
	@user = User.all
  end
def facebook_login
  params.permit!
    user = User.omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to :controller=>"products",:action=>"index"
  end
  def new
  	@user = User.new
  end
  def create
    	params.permit!
   
   @user=User.new(params[:user])
   if @user.save
    MailToUser.welcome_mail(@user).deliver
    session[:user_id]=@user.id
    
    redirect_to :action=> "index"
    flash[:notice] = "Saved Successfully" 
	else
	render "new"
	flash[:notice] = "Not Save" 
   end
  end
  def home
  end
  def let_me_login
  	@user=User.new
  end
  def allow_login
  	@user=User.check_enc_password(params[:user][:email],params[:user][:password])
  	if @user.present?

session[:user_id]=@user.id
cookies.permanent[:user_id] = @user.id if params[:remember_me].present?
#cookies[:user_id] = @user.id if !params[:remember_me].present?
redirect_to :action=>"index"
else
	redirect_to :action=>"new"
  	end
  end
  def destroy_session
session[:user_id]=nil
if session[:user_id].blank?
redirect_to root_path
end
  end
  private 
  def user_params 
  	params.require(:user).permit
  end
end
