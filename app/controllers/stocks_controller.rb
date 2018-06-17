class StocksController < ApplicationController
  def index
    @stocks = Stock.all

  end


  def show
    if params[:stock].present?
      if params[:stock][:symbol].blank?
        @nothing = "Enter a Valid Symbol"
      else
        begin
          @stock = Stock.find_by(symbol: params[:stock][:symbol].upcase)
          if @stock.blank?
            @stock = StockQuote::Stock.quote(params[:stock][:symbol])
            Stock.save_new_stock(@stock) if @stock.present?
          end
        rescue
          @error = "Check your search and try again."
        end
      end
    else
      @error = "Check your search and try again."
    end
  end




end
