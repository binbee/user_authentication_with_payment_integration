class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
before_action :login_require
  def login_require
    @user=User.find session[:user_id] rescue ""
    if !@user.blank?
    	puts"-------------------------#{session[:user_id]}"
       else
        redirect_to root_path 
    
    end
  end
end
