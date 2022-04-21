# frozen_string_literal: true

module Api
  module V1
    class DnaSerializer < ActiveModel::Serializer
      attributes :id, :dna_pattern, :comments, :count_mutant_dna, :count_human_dna, :ratio
    end
  end
end
