module DraftBox
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception, unless: -> { Rails.configuration.try(:api_only) }
  end
end
