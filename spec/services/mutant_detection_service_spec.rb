# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MutantDetectionService do
  describe '#mutant?' do
    context 'when subject is mutant' do
      let(:human_dna) do
        %w[ATGCGA CAGTGC TTATGT AGAAGG CCCCTA TCACTG]
      end
      subject { MutantDetectionService.new(human_dna) }

      it 'return with mutant is true' do
        expect(subject.mutant?).to be_truthy
        expect(subject.is_mutant).to be_truthy
        expect(subject.message).to eq 'El sujeto es mutante'
      end
    end

    context 'when subject is not mutant' do
      let(:human_dna) do
        %w[ATGCGA CAGTGC TTATTT AGACGG GCGTCA TCACTG]
      end
      subject { MutantDetectionService.new(human_dna) }

      it 'return with mutant is true' do
        expect(subject.mutant?).to be_falsy
        expect(subject.is_mutant).to be_falsy
        expect(subject.message).to eq 'El sujeto no es mutante'
      end
    end
  end
end
