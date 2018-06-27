class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks
  scope :trending_stocks, -> { where(trending: true) }
  scope :not_trending_stocks, -> { where(trending: false) }
  has_many :news_articles
  has_many :dividends
  after_commit :create_dividends, on: :create

  def is_trending?
    stock_users = self.user_stocks.count
    users = User.all.count
    percentage = ((stock_users * 100)/users).round(2)
    percentage >= 75
  end

  def not_trending?
    stock_users = self.user_stocks.count
    users = User.all.count
    percentage = ((stock_users * 100)/users).round(2)
    percentage < 75
  end

  def create_dividends
    dividends = JSON.parse(get_dividends(self.symbol))
    dividends.each do |div|
      Dividend.create(dividend_params(div, self.id))
    end
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


  def self.save_new_stock(stock_object)
    Stock.create(
      symbol: stock_object[:stock].symbol.upcase,
      company_name: stock_object[:stock].company_name,
      open: stock_object[:stock].open,
      primary_exchange: stock_object[:stock].primary_exchange,
      sector: stock_object[:stock].sector,
      calculation_price: stock_object[:stock].calculation_price,
      open_time: stock_object[:stock].open_time,
      close: stock_object[:stock].close,
      close_time: stock_object[:stock].close_time,
      high: stock_object[:stock].high,
      low: stock_object[:stock].low,
      latest_price: stock_object[:stock].latest_price,
      latest_time: stock_object[:stock].latest_time,
      latest_update: stock_object[:stock].latest_update,
      latest_volume: stock_object[:stock].latest_volume,
      running_high: stock_object[:stock].week52_high,
      running_low: stock_object[:stock].week52_low,
      year_to_date_change: stock_object[:stock].ytd_change,
      chief_executive_officer: stock_object[:stock_company].ceo,
      logo: stock_object[:stock_logo].url,
      market_cap: stock_object[:stock].market_cap,
      company_description: stock_object[:stock_company].description,
      company_website: stock_object[:stock_company].website,
      company_industry: stock_object[:stock_company].industry,
      company_profit_margin: stock_object[:stock_stats].profit_margin,
      company_gross_profit: stock_object[:stock_stats].gross_profit,
      latest_earnings_per_share: stock_object[:stock_stats].latest_eps,
      shares_outstanding: stock_object[:stock_stats].shares_outstanding,
      revenue_per_share: stock_object[:stock_stats].revenue_per_share,
      revenue_per_employee: stock_object[:stock_stats].revenue_per_employee,
      company_cash: stock_object[:stock_stats].cash,
      company_debt: stock_object[:stock_stats].debt,
      short_interest: stock_object[:stock_stats].short_interest,
      short_date: stock_object[:stock_stats].short_date,
      dividend_rate: stock_object[:stock_stats].dividend_rate,
      dividend_yield: stock_object[:stock_stats].dividend_yield,
      expected_dividend_date: stock_object[:stock_stats].ex_dividend_date,
      latest_eps: stock_object[:stock_stats].latest_eps,
      latest_eps_date: stock_object[:stock_stats].latest_eps_date,
      float: stock_object[:stock_stats].float,
      return_on_equity: stock_object[:stock_stats].return_on_equity,
      consensus_eps: stock_object[:stock_stats].consensus_eps,
      number_of_estimates: stock_object[:stock_stats].number_of_estimates,
      eps_surprise_dollar: stock_object[:stock_stats].eps_surprise_dollar,
      eps_surprise_percent: stock_object[:stock_stats].eps_surprise_percent,
      return_on_assets: stock_object[:stock_stats].return_on_assets,
      return_on_capital: stock_object[:stock_stats].return_on_capital,
      institution_percent: stock_object[:stock_stats].institution_percent,
      insider_percent: stock_object[:stock_stats].insider_percent,
      short_ratio: stock_object[:stock_stats].short_ratio,
      five_year_percent_change: stock_object[:stock_stats].year5_change_percent,
      two_year_percent_change: stock_object[:stock_stats].year2_change_percent,
      one_year_percent_change: stock_object[:stock_stats].year1_change_percent,
      six_month_percent_change: stock_object[:stock_stats].month6_change_percent,
      three_month_percent_change: stock_object[:stock_stats].month3_change_percent,
      one_month_percent_change: stock_object[:stock_stats].month1_change_percent,
      five_day_percent_change: stock_object[:stock_stats].day5_change_percent,
      net_income: stock_object[:stock_financials].financials.first["netIncome"],
      total_revenue: stock_object[:stock_financials].financials.first["totalRevenue"],
      current_cash: stock_object[:stock_financials].financials.first["currentCash"],
      cost_of_revenue: stock_object[:stock_financials].financials.first["costOfRevenue"],
      research_and_development: stock_object[:stock_financials].financials.first["researchAndDevelopment"],
      operating_expenses: stock_object[:stock_financials].financials.first["operatingExpense"],
      operating_income: stock_object[:stock_financials].financials.first["operatingIncome"],
      gross_profit: stock_object[:stock_financials].financials.first["grossProfit"],
      current_debt: stock_object[:stock_financials].financials.first["currentDebt"],
      current_assets: stock_object[:stock_financials].financials.first["currentAssets"],
      total_assets: stock_object[:stock_financials].financials.first["totalAssets"],
      total_debt: stock_object[:stock_financials].financials.first["totalDebt"],
      total_cash: stock_object[:stock_financials].financials.first["totalCash"],
      report_date: stock_object[:stock_financials].financials.first["reportDate"],
      news_articles: stock_object[:stock_news].news.map{|h| NewsArticle.new(
        published_at: h['datetime'],
        headline: h['headline'],
        source: h['source'],
        url: h['url'],
        summary: h['summary'],
        related_stocks: h['related'])}
      )
    end


    def dividend_params dividend, stock_id
      {stock_id: stock_id, payment_date: dividend['paymentDate'], declared_date: dividend['declaredDate'], amount: dividend['amount'], dividend_type: dividend['type']}
    end


  end
