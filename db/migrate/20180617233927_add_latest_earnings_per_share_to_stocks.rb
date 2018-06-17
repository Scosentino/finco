class AddLatestEarningsPerShareToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :latest_earnings_per_share, :string
  end
end
