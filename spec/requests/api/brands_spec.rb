require 'rails_helper'

RSpec.describe '/api/brands', type: :request do
  let(:valid_attributes) do
    {
      name: 'Toyota'
    }
  end

  let(:invalid_attributes) do
    {
      name: '',
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      create(:brand)
      get api_brands_url, as: :json
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Brand' do
        expect do
          post api_brands_url,
               params: valid_attributes, as: :json
        end.to change(Brand, :count).by(1)
      end

      it 'renders a JSON response with the new Brand' do
        post api_brands_url,
             params: valid_attributes, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Brand' do
        expect do
          post api_brands_url,
               params: invalid_attributes, as: :json
        end.to change(Brand, :count).by(0)
      end

      it 'renders a JSON response with errors for the new Brand' do
        post api_brands_url,
             params: invalid_attributes, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end