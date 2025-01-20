class EventsController < ApplicationController
  allow_unauthenticated_access
  skip_forgery_protection

  def line
    render plain: "OK"
  end
end
