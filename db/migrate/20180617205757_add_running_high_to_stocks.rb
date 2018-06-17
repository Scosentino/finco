class AddRunningHighToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :running_high, :string
  end
end
