class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by email: params[:email]
    if admin&.authenticate(params[:password])
      sign_in admin
      redirect_to root_path
    else
      flash[:warning] = 'Incorrect email and/or password!'
      render :new
    end
  end

  def destroy
    session.delete :admin_id
    flash[:success] = 'See you later!'
    redirect_to root_path
  end
end