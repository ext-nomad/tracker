class HomeController < ApplicationController
  def index
    if current_user
      redirect_to my_portfolio_path
    else
      redirect_to new_user_session_path
    end
  end

  def about; end
end
