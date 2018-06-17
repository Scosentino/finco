class AddLatestTimeToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :latest_time, :string
  end
end
