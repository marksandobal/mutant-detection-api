# frozen_string_literal: true

# logic for authentication with token jwt
module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user
  end

  private

  def authenticate_user
    decoded_jwt   = JsonWebToken.decode(jwt)
    @user_id      = decoded_jwt['id']
    @current_user = User.find(@user_id)
  end

  def jwt
    raise Mutant::Exceptions::MissingToken unless request.headers.include?(:Authorization)

    request.headers.fetch(:Authorization)
  end
end
