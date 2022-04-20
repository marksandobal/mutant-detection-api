# frozen_string_literal: true

# process dnas
class MutantsController < ApplicationController
  before_action :dna_patther_valid?, only: [:create]

  def index
    render json: { hola: "Hola" }
  end

  def create
    
  end

  private

  def dna_patther_valid?
    dna_pattern = ValidateStringDna.new(params[:dna])
    dna_pattern.validate_patterns

    render json: { error: dna_pattern.error, code: 403 }, status: :forbidden \
      unless dna_pattern.valid_patterns
  end

end
