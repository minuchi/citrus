class Rss::SubscriptionsController < ApplicationController
  before_action :set_current_user

  def index
    @subscriptions = Rss::Subscription.where(user: @current_user)
  end

  def new
  end

  def create
  end

  def destroy
    @subscription = Rss::Subscription.find(params[:id])
  end

  private
    def set_current_user
      @current_user ||= Current.session.user if Current.session
    end
end
