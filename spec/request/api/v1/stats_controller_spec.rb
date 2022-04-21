# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::StatsController, type: :request do
  describe 'GET #index' do
    let(:user) { create(:user) }

    let(:token) { user.to_token }

    let(:headers) { authenticated_headers(token) }

    context 'when return empty array' do
      it 'responds with http status ok' do
        get '/api/stats', params: {}, headers: headers
        expect(response).to have_http_status(:ok)
      end

      it 'return json data' do
        get '/api/stats', params: {}, headers: headers
        expect(response.body).to eq('[]')
      end
    end

    context 'when exist record in db' do
      before do
        create(:subject)
      end
      it 'responds with http status ok' do
        get '/api/stats', params: {}, headers: headers
        expect(response).to have_http_status(:ok)
      end

      it 'return json data' do
        get '/api/stats', params: {}, headers: headers
        expect(response.body).to have_json_size(1)
      end
    end
  end
end
