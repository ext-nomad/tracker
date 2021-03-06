class StocksController < ApplicationController
  def search
    respond_to do |format|
      if params[:stock].present?
        @stock = Stock.new_lookup(params[:stock])
        flash.now[:alert] = 'Please enter a valid symbol to search' unless @stock
      else
        flash.now[:alert] = 'Please enter a symbol to search'
      end
      format.js { render partial: 'users/result' }
    end
  end

  def update; end

  def update_prices
    Stock.update_prices(current_user)
    redirect_to my_portfolio_path, notice: 'Prices was successfully updated.'
  end
end
