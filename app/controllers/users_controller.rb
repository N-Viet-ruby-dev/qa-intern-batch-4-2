class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :load_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @questions = @user.questions.newest
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      redirect_to @user, success: "Sign up successfully!"
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      redirect_to @user, success: "Profile update successfully"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :phone, :address, :picture,
                                 :password, :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    redirect_to root_path, danger: "User not found"
  end

  def correct_user
    return if current_user?(@user)
    redirect_to root_path, danger: "Do not edit other users"
  end
end
