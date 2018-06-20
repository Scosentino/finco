class StockPriceUpdateWorker
  include Sidekiq::Worker

  def perform
     if Time.now.hour > 8 && Time.now.hour < 20
       stocks = Stock.all
       stocks.each do |stock|
         new_stock = StockQuote::Stock.quote(stock.symbol.upcase)
         p '=========='
         puts new_stock.latest_price
         p '=========='
         stock.update(latest_price: new_stock.latest_price)
       end
     end
   end

end
