# frozen_string_literal: true

FactoryBot.define do
  factory :dna do
    dna_pattern { [] }
    comments { 'This is a comment' }
    count_mutant_dna { Faker::Number.between(from: 1, to: 100) }
    count_human_dna { Faker::Number.between(from: 1, to: 100) }
    ratio { Faker::Number.between(from: 1, to: 100) }
  end
end
