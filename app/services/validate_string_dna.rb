# frozen_string_literal: true

# Validate if human DNA has the correct pattern
class ValidateStringDna
  attr_accessor :human_dna, :invalid_adn, :valid_patterns, :error

  def initialize(human_dna)
    @human_dna = human_dna
    @valid_patterns = true
    @invalid_adn = []
  end

  def validate_patterns
    return empty_human_dna_data unless human_dna.present?
    return unless validation_length

    human_dna.map do |dna_code|
      result = invalid_pattern(dna_code.upcase)
      invalid_adn << dna_code if result
    end

    @valid_patterns = false unless invalid_adn.count.zero?

    @error = "Existen secuencias de ADN incorrectas: #{invalid_adn}"
  end

  private

  def empty_human_dna_data
    @valid_patterns = false
    @error = "el parámetro 'adn' no puede estar vacío."
  end

  def invalid_pattern(patter)
    codes = patter.split('')
    result = codes.map { |code| true if %w[B D E F H I J K L M N Ñ O P Q R S U V W X Y Z].include?(code) }

    result.reject(&:nil?).first
  end

  def validation_length
    validation = human_dna.map { |nda| nda.length.eql? 6 }
    return true unless validation.include?(false)

    @valid_patterns = false
    @error = 'Una de las secuencias no cumple con el tamaño de longitud de 6'
    valid_patterns
  end
end
