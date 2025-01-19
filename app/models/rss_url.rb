class RssUrl < ApplicationRecord
  has_many :rss_subscriptions, dependent: :destroy
end
