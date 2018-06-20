class CreateNewsArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :news_articles do |t|
      t.string :published_at
      t.string :headline
      t.string :source
      t.string :url
      t.string :summary
      t.string :related_stocks
      t.integer :stock_id
      t.timestamps
    end
  end
end
