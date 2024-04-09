module Api
  class BrandsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      brands = Brand.all
      render json: brands, status: :ok
    end

    def create
      brand = Brand.new(name: params[:name])
      if brand.save
        render json: brand, status: :ok
      else
        render json: { error: brand.errors }, status: :unprocessable_entity
      end
    end

    def models_by_brand
      begin
        models = Brand.find(params[:id]).models
        render json: models, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Brand not found" }, status: :not_found
      end
    end
  end
end