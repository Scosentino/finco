class AddLatestUpdateToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :latest_update, :string
  end
end
