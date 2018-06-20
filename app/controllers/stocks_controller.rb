class StocksController < ApplicationController

  def update_market
    render 'market_update.js.erb'
  end

  def index
    @stocks = Stock.all

  end

  def show
    if params[:stock].present?
      if params[:stock][:symbol].blank?
        @nothing = "Enter a Valid Symbol"
      else
          @stock = Stock.find_by(symbol: params[:stock][:symbol].upcase)
          if @stock.blank?
            stock = return_stock_data(params[:stock][:symbol])
            if stock.present?
              byebug
              @stock = Stock.save_new_stock(stock)
            else
              @error = "Check your search and try again."
            end
          end
          ##@error = "Check your search and try again."
        ##end
      end
    else
      @error = "Check your search and try again."
    end
  end

  def return_stock_data(symbol)
    begin
    {
        stock: StockQuote::Stock.quote(symbol),
        stock_company: StockQuote::Stock.company(symbol),
        stock_logo: StockQuote::Stock.logo(symbol),
        stock_stats: StockQuote::Stock.stats(symbol),
        stock_financials: StockQuote::Stock.financials(symbol),
        stock_relevant_companies: StockQuote::Stock.relevant(symbol),
        stock_news: StockQuote::Stock.news(symbol)
    }
    rescue Execption => e
      @error = "Check your search and try again."
    end
  end



end
