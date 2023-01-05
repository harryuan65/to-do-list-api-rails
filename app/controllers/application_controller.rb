class ApplicationController < ActionController::API
  include ErrorBoundary::ApiHandler

  def index
    render text: "OK"
  end
end
