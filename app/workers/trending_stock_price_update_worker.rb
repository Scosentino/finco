class TrendingStockPriceUpdateWorker
  include Sidekiq::Worker


  def perform
   stock_symbols = Stock.trending_stocks.pluck(:symbol)
   new_stocks = StockQuote::Stock.batch('quote', stock_symbols)
   if new_stocks.is_a?(Array)
     new_stocks.each do |n_s|
     stock = Stock.find_by(symbol: n_s.symbol)
     stock.update(latest_price: n_s.latest_price) if stock.present?
   end
   else
    stock = Stock.find_by(symbol: new_stocks.symbol)
     stock.update(latest_price: new_stocks.latest_price) if stock.present?
   end

   if Time.now >= Time.parse("#{Time.now.to_date} 9:30 AM") && Time.now <= Time.parse("#{Time.now.to_date} 4:00 PM")
     TrendingStockPriceUpdateWorker.perform_in(5.second)
   end
  end

end
