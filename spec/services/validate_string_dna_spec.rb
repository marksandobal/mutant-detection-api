# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ValidateStringDna do
  describe '::INVALID_DNA_CODE' do
    it 'return expected array' do
      expect(ValidateStringDna::INVALID_DNA_CODE).to eq %w[B D E F H I J K L M N Ñ O P Q R S U V W X Y Z]
    end
  end

  describe '#validate_patterns' do
    context 'with valid params' do
      let(:human_dna) do
        %w[ATGCGA CAGTGC TTATTT AGACGG GCGTCA TCACTG]
      end

      subject { ValidateStringDna.new(human_dna) }

      it 'return valid patterns' do
        subject.validate_patterns
        expect(subject.valid_patterns).to be_truthy
      end
    end

    context 'with invalid params' do
      context 'when the dna pattern has bad length' do
        let(:human_dna) do
          %w[ATGCGAC CAGTGC TTATTT AGACGG GCGTCA TCACTG]
        end

        subject { ValidateStringDna.new(human_dna) }

        it 'return valid patterns' do
          subject.validate_patterns
          expect(subject.valid_patterns).to be_falsy
          expect(subject.error).to eq('Una de las secuencias no cumple con el tamaño de longitud de 6')
        end
      end

      context 'when the dna pattern have invalid code letter' do
        let(:human_dna) do
          %w[ATGCSA CAPTGC TTATTT AGACGG GCGTCA TCACTG]
        end

        subject { ValidateStringDna.new(human_dna) }

        it 'return valid patterns' do
          subject.validate_patterns
          expect(subject.valid_patterns).to be_falsy
          expect(subject.error).to eq('Existen secuencias de ADN incorrectas: ["ATGCSA", "CAPTGC"]')
        end
      end

      context 'when params is empty' do
        subject { ValidateStringDna.new([]) }

        it 'return valid patterns' do
          subject.validate_patterns
          expect(subject.valid_patterns).to be_falsy
          expect(subject.error).to eq("El parámetro 'adn' no puede estar vacío.")
        end
      end
    end
  end
end
