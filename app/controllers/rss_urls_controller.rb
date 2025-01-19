class RssUrlsController < ApplicationController
  before_action :set_current_user

  def index
    @rss_urls = RssUrl.all
  end

  def new
    @rss_url = RssUrl.new
  end

  def create
    @rss_url = RssUrl.new(rss_url_params)
    if @rss_url.save
      redirect_to rss_urls_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @rss_url = RssUrl.find(params[:id])
    @rss_url.destroy
    redirect_to rss_urls_path
  end

  private

  def set_current_user
    @current_user ||= Current.session.user if Current.session
  end

  def rss_url_params
    params.expect([ rss_url: [ :url ] ])
  end
end
