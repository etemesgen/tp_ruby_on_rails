class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :current_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Bienvenue #{@user.name}, Connecte toi maintenant !"
      redirect_to root_path
    else
      flash.now[:danger] = 'Vous devez renseigner tous les champs et valider votre mot de passe.'
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile mis à jour !"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "Utilisateur supprimé !"
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    redirect_to(root_url) unless current_user == @user
  end
end
