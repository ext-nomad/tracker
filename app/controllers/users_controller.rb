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
        @friend_s = User.search(params[:friend])
        @friend_s = current_user.except_current_user(@friend_s)
        flash.now[:alert] = "Couldn't find user" unless @friend_s
      else
        flash.now[:alert] = 'Please enter a name or email to search'
      end
      format.js { render partial: 'users/friend_result' }
    end
  end
end
