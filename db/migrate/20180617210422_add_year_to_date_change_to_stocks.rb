class AddYearToDateChangeToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :year_to_date_change, :string
  end
end
