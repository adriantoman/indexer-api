module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message, status: 'error' }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message, status: 'error' }, :unprocessable_entity)
    end

    rescue_from URI::InvalidURIError do |e|
      json_response({ message: 'Invalid URL', status: 'error' }, :bad_request)
    end

    rescue_from StandardError do |e|
      json_response({ message: e.message, status: 'error' }, :bad_request)
    end

  end
end