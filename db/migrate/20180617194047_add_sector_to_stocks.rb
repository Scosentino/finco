class AddSectorToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :sector, :string
  end
end
