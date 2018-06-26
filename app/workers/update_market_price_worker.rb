class UpdateMarketPriceWorker
  include Sidekiq::Worker

  def perform
   markets = JSON.parse(get_market_data)
   markets.each do |market|
     market_from_db = Market.find_by(mic: market['mic'])
     if market_from_db.blank?
        Market.create(market_params(market))
     else
       market_from_db.update(market_params(market))
     end
   end
 end

  def get_market_data
    require 'net/http'
    require 'net/https'
    require 'uri'

    uri = URI.parse("https://api.iextrading.com/1.0/market")
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(uri.request_uri)

    response = https.request(request)
    response.body
  end

  def market_params(market)
    {mic: market['mic'], venue_name: market['venueName'], tape_a: market['tapeA'], tape_b: market['tapeB'], tape_c: market['tapeC'], market_percent: market['marketPercent'], last_updated: market['lastUpdated']}
  end

end
