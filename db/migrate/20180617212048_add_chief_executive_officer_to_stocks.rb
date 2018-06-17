class AddChiefExecutiveOfficerToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :chief_executive_officer, :string
  end
end
