class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to users_index_path, notice: "Signed in!"
  end

  def destroy
    sessions[:user_id] = nil
    redirect_to users_index_path, notice: "Signed out!"
  end


end