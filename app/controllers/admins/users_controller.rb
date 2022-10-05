class Admins::UsersController < ApplicationController
  before_action :find_user, except: :index
  before_action :require_authentication


  def index
    @users = User.order(created_at: :desc)
  end

  def show
  end 

  def edit
  end

  def update
    if @user.update user_params
      flash[:success] = 'User updated!'
      redirect_to admins_users_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = 'Question deleted!'
    redirect_to admins_users_path
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
  end

  def user_params
    params.require(:user).permit(:username, :email)
  end
end

