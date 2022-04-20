# frozen_string_literal: true

# record prospect to mutant
class RecordSubject
  attr_reader :dna_pattern, :mutant, :subject

  def initialize(dna_pattern, mutant)
    @dna_pattern = dna_pattern
    @mutant = mutant
  end

  def find_or_create
    @subject = Subject.find_or_create_by!(attributes_subject)
    Dna.find_or_create_by!(attributes_dna)
  end

  private

  def attributes_subject
    {
      code_name: generate_code_name,
      gender: 'undefined',
      mutant: mutant
    }
  end

  def attributes_dna
    {
      subject: subject,
      dna_pattern: dna_pattern
    }
  end

  def generate_code_name
    "Subject #{Subject.random_code}"
  end
end
