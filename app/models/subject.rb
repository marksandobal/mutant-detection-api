# frozen_string_literal: true

# subject model
class Subject < ApplicationRecord
  has_one :dna

  GENDER_OPTIOPNS = %w[male female undefined].freeze

  validates :gender, inclusion: { in: GENDER_OPTIOPNS }

  before_save :assigned_code_name

  private

  def random_code
    rand(10) + Subject.count
  end

  def assigned_code_name
    self.code_name = "Subject #{random_code}" if code_name.blank?
  end
end
