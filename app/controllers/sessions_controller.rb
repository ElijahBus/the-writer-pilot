# frozen_string_literal: true

class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? & user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to root_path, notice: "Successfully Logged In !"
    else
      flash[:error] = "Invalid username or password !"
      render :new
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path, notice: "Logged Out !"
  end
end
