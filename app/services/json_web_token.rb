# frozen_string_literal: true

class JsonWebToken
  def self.decode(token)
    body = JWT.decode(token, Rails.application.credentials.jwt_secret)[0]
    HashWithIndifferentAccess.new(body)
  rescue
    nil
  end

  def self.encode(payload)
    JWT.encode(payload, Rails.application.credentials.jwt_secret)
  end
end
