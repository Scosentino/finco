class AddFieldsToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :net_income, :string
    add_column :stocks, :total_revenue, :string
    add_column :stocks, :current_cash, :string
    add_column :stocks, :cost_of_revenue, :string
    add_column :stocks, :research_and_development, :string
    add_column :stocks, :operating_expenses, :string
    add_column :stocks, :operating_income, :string
    add_column :stocks, :gross_profit, :string
    add_column :stocks, :current_debt, :string
    add_column :stocks, :current_assets, :string
    add_column :stocks, :total_assets, :string
    add_column :stocks, :total_debt, :string
    add_column :stocks, :total_cash, :string
    add_column :stocks, :report_date, :string
  end
end
