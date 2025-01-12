class RssSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :rss_url
end
