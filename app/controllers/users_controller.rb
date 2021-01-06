class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def search
    respond_to do |format|
      if params[:friend].present?
        @friend = User.find(2)
        flash.now[:alert] = 'Please enter a valid name to search' unless @friend
      else
        flash.now[:alert] = 'Please enter a name to search'
      end
      format.js { render partial: 'users/friend_result' }
    end
  end
end
