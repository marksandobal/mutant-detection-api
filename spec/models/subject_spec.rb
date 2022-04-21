# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe '::GENDER_OPTIOPNS' do
    it 'return spected array options' do
      expect(Subject::GENDER_OPTIOPNS).to eq %w[male female undefined]
    end
  end

  it { is_expected.to validate_inclusion_of(:gender).in_array(%w[male female undefined]) }

  describe 'active record callback before_save' do
    context 'when create subject' do
      it 'assigned code name' do
        subject = Subject.new
        subject.name = 'Marzo'
        subject.surname = 'Ramos'
        subject.last_name = 'Felix'
        subject.gender = 'male'
        subject.age = 21
        subject.mutant = false
        subject.address = 'New direction'

        subject.save
        expect(subject.code_name).not_to be_nil
      end
    end

    context 'when update subject' do
      let(:subject) { create(:subject) }

      it 'return code_name' do
        code_name = subject.code_name
        subject.update(name: 'Abril', surname: 'Castaneda', last_name: 'Frikano')
        expect(subject.reload.code_name).to eq code_name
      end
    end
  end
end
