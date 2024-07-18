class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Successfully Logged into the Account!'
    else
      flash.now[:alert] = 'Invalid email or password, Please try again!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Successfully Logged Out of the Account!'
  end
end
