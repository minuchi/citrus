class Rss::Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :rss_url, class_name: "Rss::Url"
end
