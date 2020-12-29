class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        redirect_to my_portfolio_path, alert: 'Please enter a symbol to search'
      end
    else
      redirect_to my_portfolio_path, alert: 'Please enter a symbol to search'
    end
  end
end
