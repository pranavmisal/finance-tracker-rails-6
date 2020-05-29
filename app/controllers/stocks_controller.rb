class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        flash[:alert] = "Please enter a valid symbol to search"
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = "Plaese enter a symbol to search"
      redirect_to my_portfolio_path
    end
  end
end
