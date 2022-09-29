class AdminController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :first_name, :last_name, :role, :password, :password_confirmation))
    if @user.save
      flash[:success] = "Successfully invited a member"
      redirect_to admin_form_path
    else 
      flash[:error] = @user.errors.full_messages.last
      redirect_to admin_form_path
    end
  end
end
