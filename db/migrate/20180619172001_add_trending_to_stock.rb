class AddTrendingToStock < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :trending, :boolean, default: false
  end
end
