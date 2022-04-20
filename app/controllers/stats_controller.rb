# frozen_string_literal: true

# process dnas
class StatsController < ApplicationController
  def index
    render json: subjects, each_serializer: SubjectSerializer, status: :ok
  end

  private

  def subjects
    @subjects ||= Subject.includes(:dna).all
  end
end
