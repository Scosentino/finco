class AddLatestPriceToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :latest_price, :string
  end
end
