class Rss::SubscriptionsController < ApplicationController
  before_action :set_current_user

  def index
    @rss_subscriptions = @current_user.rss_subscriptions
  end

  def new
    @rss_subscription = Rss::Subscription.new
    subscribed_rss_url_ids = @current_user.rss_subscriptions.pluck(:rss_url_id)
    @urls = Rss::Url.where.not(id: subscribed_rss_url_ids)
  end

  def create
    @rss_subscription = Rss::Subscription.new(rss_subscription_params.merge(user: @current_user))
    if @rss_subscription.save
      redirect_to rss_subscriptions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @rss_subscription = Rss::Subscription.find(params[:id])
    @rss_subscription.destroy
    redirect_to rss_subscriptions_path
  end

  private
    def set_current_user
      @current_user ||= Current.session.user if Current.session
    end

    def rss_subscription_params
      params.expect([ rss_subscription: [ :rss_url_id ] ])
    end
end
