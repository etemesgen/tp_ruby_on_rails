class PagesController < ApplicationController
  before_action :redirect_to_dashboard_if_logged_in, only: [:accueil]

  def accueil
  end

  def faq
  end

  def contact
  end

  def dashboard
    @tasks = Task.all
  end

  private

  def redirect_to_dashboard_if_logged_in
    redirect_to dashboard_path if logged_in?
  end
end
