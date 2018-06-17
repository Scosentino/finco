class AddCloseToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :close, :string
  end
end
