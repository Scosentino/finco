require 'sidekiq-scheduler'

class UpdateOpenCloseStockPriceWorker
  include Sidekiq::Worker


  def perform
    stocks = Stock.all
    stocks.each do |stock|
      if Time.now.hour > 12
        stock.close = StockQuote::Stock.quote(stock.symbol).close
      else
        stock.open = StockQuote::Stock.quote(stock.symbol).open
      end
      stock.save
    end
  end

end
