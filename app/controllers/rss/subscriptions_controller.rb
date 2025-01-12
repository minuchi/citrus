class Rss::SubscriptionsController < ApplicationController
  before_action :set_current_user

  def index
    @subscriptions = Rss::Subscription.where(user: @current_user)
  end

  def new
    @subscription = Rss::Subscription.new
    @urls = Rss::Url.all
  end

  def create
    @subscription = Rss::Subscription.new(rss_subscription_params.merge(user: @current_user))
    if @subscription.save
      redirect_to rss_subscriptions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @subscription = Rss::Subscription.find(params[:id])
    @subscription.destroy
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
