# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Lalo' }
    last_name { 'Makako' }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
