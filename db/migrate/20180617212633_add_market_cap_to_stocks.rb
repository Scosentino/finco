class AddMarketCapToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :market_cap, :string
  end
end
