class StaticPagesController < ApplicationController
  before_action :require_login, only: %i[theclub]

  def home
  end

  def theclub
    @users = User.all
  end

  private

  def require_login
    unless logged_in?
      flash[:danger] = 'You must be logged in to access this section'
      redirect_to login_path
    end
  end
end
