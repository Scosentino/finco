class CreateDividend < ActiveRecord::Migration[5.1]
  def change
    create_table :dividends do |t|
      t.belongs_to :stock
      t.date :payment_date
      t.date :declared_date
      t.float :amount
      t.string :dividend_type
    end
  end
end
