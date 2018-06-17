class AddCompanyDebtToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :company_debt, :string
  end
end
