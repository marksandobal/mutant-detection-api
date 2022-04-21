# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ValidateStringDna do
  describe '#find_or_create' do
    let(:dna) do
      %w[ATGCGA CAGTGC TTATGT AGAAGG CCCCTA TCACTG]
    end

    let(:mutant) { true }
    context 'when create subject' do
      subject { RecordSubject.new(dna, mutant) }

      it 'return new record' do
        subject.find_or_create
        expect(Subject.count).to eq 1
        expect(subject.subject.class).to eq(Subject)
      end
    end

    context 'when find existent subject' do
      let!(:mutant) { create(:subject, gender: 'undefined') }

      before do
        mutant.dna.update dna_pattern: %w[ATGCGA CAGTGC TTATGT AGAAGG CCCCTA TCACTG]
      end

      subject { RecordSubject.new(mutant.dna, mutant.mutant) }

      it 'return existent object' do
        subject.find_or_create
        expect(subject.subject).to eq mutant
      end
    end
  end
end
