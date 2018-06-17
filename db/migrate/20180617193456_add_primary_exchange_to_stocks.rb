class AddPrimaryExchangeToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :primary_exchange, :string
  end
end
