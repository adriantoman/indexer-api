require 'rails_helper'

RSpec.describe 'Pages API', type: :request do
  # initialize test data
  before { DatabaseCleaner.clean }

  let!(:pages) { create_list(:page, 10) }
  let(:page_id) { pages.first.id }

  # Test suite for GET /todos
  describe 'GET /pages' do
    # make HTTP get request before each example
    before { get '/pages' }

    it 'returns pages' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  #Test suite for POST /pages
  describe 'POST /pages' do
    # valid payload
    let(:valid_attributes) { { url: 'https://www.google.com'} }
    context 'when the request is valid' do
      before do
        allow(HTTParty).to receive(:get).and_return("<html></html>")
        post '/pages', params: valid_attributes
      end

      it 'creates a todo' do
        expect(json['status']).to eq('ok')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/pages', params: { title: 'Foobar' } }

      it 'returns status code 401' do
        expect(response).to have_http_status(400)
      end

      it 'returns a validation failure message' do
        expect(json['message']).to eq("Param 'url' not found")
        expect(json['status']).to eq('error')
      end
    end
  end

end