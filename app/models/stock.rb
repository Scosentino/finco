class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks
  scope :trending_stocks, -> { where(trending: true) }
  scope :not_trending_stocks, -> { where(trending: false) }

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
        report_date: stock_object[:stock_financials].financials.first["reportDate"]
    )
  end

end
