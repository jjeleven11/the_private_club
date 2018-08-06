class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def new
    redirect_to user_path(current_user.id) if logged_in?
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      log_in @user
      flash[:success] = 'Welcome to the Secret App'
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    @user.update(user_params)

    redirect_to users_path
  end

  def destroy
    @user.destroy

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end

  def find_user
    @user = User.find(params[:id])
  end

  # def current_user_own_page?
  #   if logged_in?
  #     if current_user.id != params[:id]
  #       flash[:danger] = "Sorry, you don't have right access on this page!"
  #       redirect_to users_path
  #     else
  #       redirect_to edit_user_path(current_user)
  #     end
  #   end

  #   redirect_to users_path
  # end
end
