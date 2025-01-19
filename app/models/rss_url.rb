class RssUrl < ApplicationRecord
  has_many :rss_subscriptions, dependent: :destroy

  validates :url, uniqueness: true, presence: true
end
