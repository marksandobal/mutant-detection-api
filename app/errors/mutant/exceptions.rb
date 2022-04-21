# frozen_string_literal: true

# group of exceptions from mutants
module Mutant
  class Exceptions
    class MissingToken < StandardError; end

    class EndTimeError < StandardError; end

    # exception for authentication with message
    class Authentication < StandardError
      def initialize(msg)
        super(msg)
      end
    end
  end
end
