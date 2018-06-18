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
              @stock_company = StockQuote::Stock.company(params[:stock][:symbol])
              @stock_logo = StockQuote::Stock.logo(params[:stock][:symbol])
              @stock_stats = StockQuote::Stock.stats(params[:stock][:symbol])
              if @stock.present?
                  @stock = Stock.save_new_stock(@stock, @stock_company, @stock_logo, @stock_stats)
              else
                  @error = "Check your search and try again."
              end
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
