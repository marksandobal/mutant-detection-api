# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::MutantsController, type: :request do
  describe "POST #create" do
    let(:user) { create(:user) }

    let(:token) { user.to_token }

    let(:headers) { authenticated_headers(token) }

    context 'with valid data' do
      let(:params) do
        {
          dna: %w[ATGCGA CAGTGC TTATTT AGACGG GCGTCA TCACTG]
        }
      end

      it 'responds with http status ok' do
        post '/api/mutant', params: params, headers: headers
        expect(response).to have_http_status(:ok)
        expect(response.body).to eq "{\"response\":\"El sujeto no es mutante\"}"
      end
    end

    context 'when dna pattern no have the lenght' do
      let(:params) do
        {
          dna: %w[ATGSCGA CAGSTGC TTATTT AGACGG GCGTCA TCACTG]
        }
      end

      it 'responds with http status forbidden' do
        post '/api/mutant', params: params, headers: headers
        expect(response).to have_http_status(:forbidden)
        expect(response.body).to eq("{\"error\":\"Una de las secuencias no cumple con el tamaño de longitud de 6\",\"code\":403}")
      end
    end

    context 'when dna pattern no have the correct pattern' do
      let(:params) do
        {
          dna: %w[ATGCGZ CAGFGC TTATTT AGACGG GCGTCA TCACTG]
        }
      end

      it 'responds with http status forbidden' do
        post '/api/mutant', params: params, headers: headers
        expect(response).to have_http_status(:forbidden)
        expect(response.body).to eq("{\"error\":\"Existen secuencias de ADN incorrectas: [\\\"ATGCGZ\\\", \\\"CAGFGC\\\"]\",\"code\":403}")
      end
    end

    context 'when dna pattern params send empty' do
      let(:params) do
        {
          dna: []
        }
      end

      it 'responds with http status forbidden' do
        post '/api/mutant', params: params, headers: headers
        expect(response).to have_http_status(:forbidden)
        expect(response.body).to eq("{\"error\":\"Una de las secuencias no cumple con el tamaño de longitud de 6\",\"code\":403}")
      end
    end
  end
end
