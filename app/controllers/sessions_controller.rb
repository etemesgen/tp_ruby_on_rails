class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email].downcase)
    if user && user.authenticate(session_params[:password])
      log_in user
      redirect_to dashboard_path
    else
      flash.now[:danger] = 'Email ou mot de passe invalide.'
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