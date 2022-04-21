# frozen_string_literal: true

module Api
  module V1
    class UserSerializer < ActiveModel::Serializer # :nodoc:
      attributes :id, :first_name, :last_name, :email

      attribute(:created_at) { object.created_at.iso8601 }
    end
  end
end
