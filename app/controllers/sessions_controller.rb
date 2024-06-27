class SessionsController < ApplicationController
  def new
  end

  def create
    Rails.logger.debug "Params received: #{params.inspect}"
    user = User.find_by(email: session_params[:email].downcase)
    if user && user.authenticate(session_params[:password])
      log_in user
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end