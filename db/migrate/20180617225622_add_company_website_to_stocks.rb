class AddCompanyWebsiteToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :company_website, :string
  end
end
