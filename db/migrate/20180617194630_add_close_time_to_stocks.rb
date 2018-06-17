class AddCloseTimeToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :close_time, :string
  end
end
