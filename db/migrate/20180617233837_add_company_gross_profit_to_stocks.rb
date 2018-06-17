class AddCompanyGrossProfitToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :company_gross_profit, :string
  end
end
