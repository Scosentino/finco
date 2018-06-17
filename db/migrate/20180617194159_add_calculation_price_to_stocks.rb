class AddCalculationPriceToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :calculation_price, :string
  end
end
