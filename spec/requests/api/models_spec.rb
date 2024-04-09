require 'rails_helper'

RSpec.describe '/api/models', type: :request do
  let(:valid_attributes) do
    {
      name: 'Prius',
      average_price: 320000
    }
  end

  let(:invalid_attributes) do
    {
      name: '',
      average_price: 0
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      brand = create(:brand)
      model = create(:model, brand: brand)
      get api_models_url, as: :json
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Model' do
        brand = create(:brand)
        expect do
          post "/api/brands/#{brand.id}/models",
               params: valid_attributes, as: :json
        end.to change(Model, :count).by(1)
      end

      it 'renders a JSON response with the new Model' do
        brand = create(:brand)
        post "/api/brands/#{brand.id}/models",
             params: valid_attributes, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end

      it 'updates the average price of the brand' do
        brand = create(:brand)
        model = create(:model, brand: brand)
        another_model = create(:model, :another_model, brand: brand)

        expect(brand.average_price).to be(260000)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Model' do
        brand = create(:brand)
        expect do
          post "/api/brands/#{brand.id}/models",
               params: invalid_attributes, as: :json
        end.to change(Model, :count).by(0)
      end

      it 'renders a JSON response with errors for the new Model' do
        brand = create(:brand)
        post "/api/brands/#{brand.id}/models",
             params: invalid_attributes, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end