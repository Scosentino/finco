class Stock < ApplicationRecord
  has_many :user_stocks

  def self.save_new_stock(stock_object)
    Stock.create(symbol: stock_object.symbol.upcase, company_name: stock_object.company_name)
  end

end
