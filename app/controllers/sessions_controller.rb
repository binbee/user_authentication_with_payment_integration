class SessionsController < ApplicationController
 skip_before_action :login_require, only: [:create]
  def create
    user = User.omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to :controller=>"products",:action=>"index"
  end

  def destroy
    session[:user_id] = nil
  end
end
