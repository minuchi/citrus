class CreateRssSubscriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :rss_subscriptions do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :rss_url, null: false, foreign_key: true

      t.timestamps
    end
  end
end
