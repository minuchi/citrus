class RssUrlsController < ApplicationController
  before_action :set_current_user

  def index
    @rss_urls = RssUrl.all
  end

  def new
    @rss_url = RssUrl.new
  end

  def create
    @rss_url = RssUrl.new
    begin
      url = rss_url_params[:url]
      RSS::Parser.parse(URI.open(url))
      @rss_url = RssUrl.new(rss_url_params)
      if @rss_url.save
        redirect_to rss_urls_path
      else
        render :new, status: :unprocessable_entity
      end
    rescue OpenURI::HTTPError
      @rss_url.errors.add(:url, "is not accessible. Please check if the URL is correct")
      render :new, status: :bad_request
    rescue RSS::NotWellFormedError
      @rss_url.errors.add(:url, "is not a valid RSS feed")
      render :new, status: :bad_request
    rescue URI::InvalidURIError
      @rss_url.errors.add(:url, "is invalid")
      render :new, status: :bad_request
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
