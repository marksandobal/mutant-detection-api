# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ValidateStringDna do
  describe '::INVALID_DNA_CODE' do
    it 'return expected array' do
      expect(ValidateStringDna::INVALID_DNA_CODE).to eq %w[B D E F H I J K L M N Ñ O P Q R S U V W X Y Z]
    end
  end

  describe '#validate_patterns' do
    context 'when subject is mutant' do
      let(:human_dna) do
        [
          'ATGCGA',
          'CAGTGC',
          'TTATTT',
          'AGACGG',
          'GCGTCA',
          'TCACTG'
        ]
      end

      subject { ValidateStringDna.new(human_dna) }

      it 'return invalid patterns' do
        subject.validate_patterns
        expect(subject.valid_patterns).to be_falsy
      end
    end
  end
end
