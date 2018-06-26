class CreateMarket < ActiveRecord::Migration[5.1]
  def change
    create_table :markets do |t|
      t.string :mic
      t.string :venue_name
      t.bigint :tape_a
      t.bigint :tape_b
      t.bigint :tape_c
      t.float :market_percent
      t.bigint :last_updated
    end
  end
end
