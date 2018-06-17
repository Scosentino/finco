class AddLogoToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :logo, :string
  end
end
