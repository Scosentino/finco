class AddRunningLowToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :running_low, :string
  end
end
