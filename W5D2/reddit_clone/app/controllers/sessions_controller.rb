class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password],

    )

    if user
      login(user)

    else
      flash.now[:errors] = ["Invalid Username or Password"]
      redirect_to new_session_url
    end
  end

  def new
  end

  def destroy
    logout
  end
end
