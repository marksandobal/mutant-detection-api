# frozen_string_literal: true

class DnaSerializer < ActiveModel::Serializer
  attributes :id, :dna_pattern, :comments, :count_mutant_dna, :count_human_dna, :ratio
end
