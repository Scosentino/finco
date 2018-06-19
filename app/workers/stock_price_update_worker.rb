class StockPriceUpdateWorker
  include Sidekiq::Worker

  def perform
    stock = Stock.all
    stock.each do |stock|
      new_stock = StockQuote::Stock.quote(stock.symbol.upcase)
      stock.update(latest_price: new_stock.latest_price)
    end
  end

end
