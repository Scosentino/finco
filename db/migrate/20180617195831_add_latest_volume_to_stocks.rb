class AddLatestVolumeToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :latest_volume, :string
  end
end
