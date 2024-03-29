# frozen_string_literal: true

class PasswordsController < ApplicationController
  before_action :require_user_logged_in!

  def edit
  end

  def update
    if Current.user.update(update_password_params)
      redirect_to root_path, notice: "Password successfully updated !"
    else
      render :edit
    end
  end

  private
  def update_password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
