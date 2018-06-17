class AddCompanyDescriptionToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :company_description, :string
  end
end
