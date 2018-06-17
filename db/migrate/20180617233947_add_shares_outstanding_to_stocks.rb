class AddSharesOutstandingToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :shares_outstanding, :string
  end
end
