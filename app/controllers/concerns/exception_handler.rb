# frozen_string_literal: true

# handler from exceptions
module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from Mutant::Exceptions::Authentication do |e|
      render json: { errors: e }, status: :bad_request
    end

    rescue_from Mutant::Exceptions::MissingToken do |e|
      render json: { errors: I18n.t('controller.application_controller.missing_token') }, status: :bad_request
    end

    rescue_from Mutant::Exceptions::EndTimeError do |e|
      render json: {
        errors: I18n.t('controller.application_controller.end_time_error')
      }, status: :bad_request
    end
  end
end
