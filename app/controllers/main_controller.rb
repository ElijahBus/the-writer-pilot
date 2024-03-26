# frozen_string_literal: true

class MainController < ApplicationController
  def index
    flash[:notice] = "Successfully authenticated !"
    flash[:error] = "An unexpected error occurred, please try again !"
  end
end
