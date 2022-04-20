# frozen_string_literal: true

# Analyzes human DNA to detect mutans
class AnalizeDna
  SEQUENCY_LETTERS = %w[A C G T].freeze
  POSITONS = [0, 1, 2, 3, 4, 5].freeze

  attr_reader :human_dna, :sequency_in_dna_count, :message

  def initialize(human_dna)
    @human_dna = human_dna
    @sequency_in_dna_count = 0
  end

  def mutant?
    process_dna
    return true, @message = 'El sujeto es mutante' if sequency_in_dna_count > 1

    @message = 'El sujeto no es mutante'
    false
  end

  private

  def process_dna
    split_dna = human_dna.map { |dna| dna.split('') }
    process_oblique_secuency(split_dna)
    process_horizontal_sequency(split_dna)
    process_vertical_sequency(split_dna)
  end

  def process_oblique_secuency(dna_table)
    dna_sequency = []
    POSITONS.each do |index|
      dna_sequency << dna_table[index][index]
    end

    run_counter(dna_sequency)
  end

  def process_horizontal_sequency(dna_table)
    dna_sequency_array = iterate_dna_table(dna_table, 'horizontal')
    iterate_dna_sequency_array(dna_sequency_array)
  end

  def run_counter(dna_sequency)
    dna_sequency.pop(2)
    sequence_by_letter = dna_sequency.group_by { |x| x }
    SEQUENCY_LETTERS.each do |letter|
      count = sequence_by_letter[letter]&.count || 0
      @sequency_in_dna_count = sequency_in_dna_count + 1 if count == 4
    end
  end

  def process_vertical_sequency(dna_table)
    dna_sequency_array = iterate_dna_table(dna_table)
    iterate_dna_sequency_array(dna_sequency_array)
  end

  def iterate_dna_table(dna_table, position_type = 'vertical')
    dna_sequency_array = []
    POSITONS.each do |index|
      dna_sequency = []
      POSITONS.each do |z_index|
        dna_sequency << build_new_dna_table(index, z_index, dna_table, position_type)
      end
      dna_sequency_array << dna_sequency
    end

    dna_sequency_array
  end

  def iterate_dna_sequency_array(dna_sequency_array)
    dna_sequency_array.each do |dna_sequency_item|
      run_counter(dna_sequency_item)
    end
  end

  def build_new_dna_table(index, z_index, dna_table, position_array)
    return dna_table[z_index][index] if position_array.eql?('vertical')

    dna_table[index][z_index]
  end
end
