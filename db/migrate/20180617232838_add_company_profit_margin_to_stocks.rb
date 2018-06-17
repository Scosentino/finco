class AddCompanyProfitMarginToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :company_profit_margin, :string
  end
end
