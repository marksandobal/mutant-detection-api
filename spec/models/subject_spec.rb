# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe '::GENDER_OPTIOPNS' do
    it 'return spected array options' do
      expect(Subject::GENDER_OPTIOPNS).to eq %w[male female undefined]
    end
  end

  describe '#random_code' do
    it 'return string value' do
      expect(Subject.random_code.class).to eq(Integer)
    end
  end
end
