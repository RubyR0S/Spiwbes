class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  #TODO: Change logic to production
  def create
    @admin = Admin.new admin_params
    if @admin.save
      sign_in @admin
      flash[:success] = 'Welcome, new admin!'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end