# frozen_string_literal: true

module Api
  module V1
    # logic for user crud
    class UsersController < ApplicationController
      def index
        users = User.all

        render json: users, each_serializer: Api::V1::UserSerializer, status: :ok
      end

      def show
        user = User.find(params[:id])

        render json: user, serializer: Api::V1::UserSerializer, status: :ok
      rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :not_found
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: user, serializer: Api::V1::UserSerializer, status: :created
        else
          render json: { errors: user.errors.messages }, status: :bad_request
        end
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
      end
    end
  end
end
