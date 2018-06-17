class AddHighToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :high, :string
  end
end
