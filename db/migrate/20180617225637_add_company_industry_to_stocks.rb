class AddCompanyIndustryToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :company_industry, :string
  end
end
