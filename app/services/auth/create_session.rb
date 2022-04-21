# frozen_string_literal: true

module Auth
  # session service
  class CreateSession
    attr_accessor :session_created, :jwt, :errors, :email, :password, :user

    def initialize(session_params)
      @email = session_params[:email]
      @password = session_params[:password]
    end

    def generate_token
      @user = User.find_by(email: email)
      raise Mutants::Exceptions::Authentication, "#{email} not found" unless user
      raise Mutants::Exceptions::Authentication, "password of #{email} not found"\
       unless user.password_digest && user.authenticate(password)

      token = user.to_token
      @session_created = true
      @jwt = JsonWebToken.encode(token)
    end
  end
end
