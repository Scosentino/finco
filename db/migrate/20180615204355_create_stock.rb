class CreateStock < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :company_name
    end
  end
end
