# frozen_string_literal: true

module ErrorBoundary
  #
  # Handles exceptions. Maybe I should move this to a gem?
  #
  module ApiHandler
    def self.included(origin_class)
      origin_class.class_eval do
        rescue_from StandardError, with: :server_error_handler
        rescue_from ActiveRecord::RecordInvalid, ActionController::BadRequest, with: :bad_request_handler
        rescue_from ActiveRecord::RecordNotUnique, with: :conflict_handler
        rescue_from NotImplementedError, with: :not_implemented_handler
        rescue_from ActionController::RoutingError, ActiveRecord::RecordNotFound, with: :not_found_handler
      end
    end

    private

    def unauthorized_handler
      head :unauthorized
    end

    def forbidden_handler
      head :forbidden
    end

    def conflict_handler
      handle error_message: I18n.t("activerecord.errors.messages.conflict"), status: :conflict
    end

    def not_implemented_handler
      handle error_message: I18n.t("activerecord.errors.messages.not_implemented"), status: :not_implemented
    end

    def bad_request_handler(exception)
      handle error_message: exception.to_s, status: :bad_request
    end

    def server_error_handler(exception)
      error_details = "#{exception}\n#{exception.backtrace[0]}"
      Rails.logger.fatal "#{exception}\n#{exception.backtrace[0..20].join("\n")}"
      Rollbar.error(exception) if defined?(Rollbar)
      handle error_message: "#{exception}\n#{error_details}", status: :internal_server_error
    end

    def not_found_handler(exception)
      handle error_message: exception.to_s, status: :not_found
    end

    def handle(error_message:, status:)
      render json: {error: {message: error_message}}, status: status
    end
  end
end
