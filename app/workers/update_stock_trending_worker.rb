class UpdateStockTrendingWorker
  include Sidekiq::Worker

  def perform
    stocks = Stock.all
    stocks.each do |stock|
      if stock.is_trending?
         stock.update(trending: true)
      else
          stock.update(trending: false)
      end
    end
    UpdateStockTrendingWorker.perform_at(Time.now.beginning_of_day + 1.day)
  end
end
