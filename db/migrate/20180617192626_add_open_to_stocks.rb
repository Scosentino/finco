class AddOpenToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :open, :string
  end
end
