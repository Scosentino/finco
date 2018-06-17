class AddOpenTimeToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :open_time, :string
  end
end
