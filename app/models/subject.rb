# frozen_string_literal: true

# subject model
class Subject < ApplicationRecord
  has_one :dna

  GENDER_OPTIOPNS = %w[male female undefined].freeze

  validates :gender, inclusion: { in: GENDER_OPTIOPNS }

  def self.random_code
    rand(10) + count
  end
end
