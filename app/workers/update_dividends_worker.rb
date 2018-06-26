class UpdateDividendsWorker
  include Sidekiq::Worker

  def perform
   stocks = Stock.all
   stocks.each do |stock|
     dividends = JSON.parse(get_dividends(stock.symbol))
     dividend = dividends[0]
     if stock.dividends.blank?
       dividends.each do |div|
         Dividend.create(dividend_params(div, stock.id))
       end
     else
       first_dividend = stock.dividends.order('declared_date').first
       if Time.parse(first_dividend.declared_date).to_date != Time.parse(dividend['declaredDate']).to_date
         Dividend.create(dividend_params(dividend, stock.id))
       end
     end
   end
 end

  def dividend_params dividend, stock_id
    {stock_id: stock_id, payment_date: dividend['paymentDate'], declared_date: dividend['declaredDate'], amount: dividend['amount'], dividend_type: dividend['type']}
  end


  def get_dividends symbol
    require 'net/http'
    require 'net/https'
    require 'uri'

    uri = URI.parse("https://api.iextrading.com/1.0/stock/#{symbol}/dividends/5y")
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = https.request(request)
    response.body

  end



end
