# frozen_string_literal: true

class RegistrationController < ApplicationController
  def create
    @user = User.new
  end

  def signup
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Account successfully created !"
    else
      render :create
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
