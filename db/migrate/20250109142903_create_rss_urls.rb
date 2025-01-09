class CreateRssUrls < ActiveRecord::Migration[8.0]
  def change
    create_table :rss_urls do |t|
      t.text :url

      t.timestamps
    end
  end
end
