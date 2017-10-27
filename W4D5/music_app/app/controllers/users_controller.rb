class UsersController < ApplicationController

  def show
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save

      redirect_to new_session_url

    else
      flash.now[:errors] = ["Wrrooooong"]
      render :new
    end
    
  end

  def edit

  end

  def update
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
