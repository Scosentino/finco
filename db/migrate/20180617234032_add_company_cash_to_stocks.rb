class AddCompanyCashToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :company_cash, :string
  end
end
