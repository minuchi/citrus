class RssSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :rss_url

  validates :user, presence: true
  validates :rss_url, presence: true
  validates :rss_url_id, uniqueness: {
    scope: :user_id,
    message: "is already subscribed by you"
  }

  validate :user_subscription_limit

  private

  def user_subscription_limit
    if user.present? && user.rss_subscriptions.count >= 100
      errors.add(:base, "You can't have more than 100 RSS subscriptions")
    end
  end
end
