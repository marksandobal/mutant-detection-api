# frozen_string_literal: true

FactoryBot.define do
  factory :subject do
    name { Faker::Name.name }
    surname { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    code_name { 'Subject' }
    gender { 'male' }
    age { 21 }
    mutant { true }
    address { Faker::Address.street_address }

    after :create do |subject|
      create :dna, subject: subject # has_one
    end
  end
end
