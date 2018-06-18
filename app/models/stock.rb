class Stock < ApplicationRecord
  has_many :user_stocks

  def self.save_new_stock(*args)
    Stock.create(symbol: stock_object.symbol.upcase, company_name: stock_object.company_name, open: stock_object.open, primary_exchange: stock_object.primary_exchange, sector: stock_object.sector, calculation_price: stock_object.calculation_price, open_time: stock_object.open_time, close: stock_object.close, close_time: stock_object.close_time, high: stock_object.high, low: stock_object.low, latest_price: stock_object.latest_price, latest_time: stock_object.latest_time, latest_update: stock_object.latest_update, latest_volume: stock_object.latest_volume, running_high: stock_object.week52_high, running_low: stock_object.week52_low, year_to_date_change: stock_object.ytd_change, chief_executive_officer: stock_company.ceo, logo: stock_logo.url, market_cap: stock_object.market_cap, company_description: stock_company.description, company_website: stock_company.website, company_industry: stock_company.industry, company_profit_margin: stock_stats.profit_margin, company_gross_profit: stock_stats.gross_profit, latest_earnings_per_share: stock_stats.latest_eps, shares_outstanding: stock_stats.shares_outstanding, revenue_per_share: stock_stats.revenue_per_share, revenue_per_employee: stock_stats.revenue_per_employee, company_cash: stock_stats.cash, company_debt: stock_stats.debt)
  end

end
