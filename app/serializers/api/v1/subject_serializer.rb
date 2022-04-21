# frozen_string_literal: true

module Api
  module V1
    class SubjectSerializer < ActiveModel::Serializer
      attributes :id, :name, :surname, :last_name, :code_name, :gender, :age, :mutant, :address

      belongs_to :dna
    end
  end
end
