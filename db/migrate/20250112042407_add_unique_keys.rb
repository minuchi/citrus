class AddUniqueKeys < ActiveRecord::Migration[8.0]
  def change
    add_index :rss_subscriptions, [ :user_id, :rss_url_id ], unique: true
    add_index :rss_urls, :url, unique: true
  end
end
