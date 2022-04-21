# frozen_string_literal: true

module Api
  module V1
    # logic for create token user
    class SessionsController < ApplicationController
      skip_before_action :authenticate_user, only: [:create]

      def create
        service = Auth::CreateSession.new(session_params)
        service.generate_token
        render json: { session: { token: service.jwt } }, status: :created
      end

      private

      def session_params
        params.require(:session).permit(:email, :password)
      end
    end
  end
end
