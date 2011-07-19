class WelcomeController < ApplicationController
  def index
    redirect_to current_user ? home_path : login_path
  end
end
