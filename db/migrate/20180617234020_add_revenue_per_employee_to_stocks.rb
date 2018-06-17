class AddRevenuePerEmployeeToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :revenue_per_employee, :string
  end
end
