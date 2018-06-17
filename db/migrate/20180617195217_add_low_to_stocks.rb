class AddLowToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :low, :string
  end
end
