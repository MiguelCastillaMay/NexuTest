module Api
  class ScriptController < ApplicationController
    skip_before_action :verify_authenticity_token

    def populate_database
      require 'json'
  
      data = File.read('db/models.json')
      models = JSON.parse(data)
  
      models.each do |model_data|
        brand = Brand.find_or_create_by!(name: model_data['brand_name'])
        model = Model.new(name: model_data['name'], average_price: model_data['average_price'], brand: brand)
        next unless model.valid?
        model.save
      end
  
      render json: { message: 'Database populated successfully' }, status: :ok
    rescue => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end
end