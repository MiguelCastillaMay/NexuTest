module Api
  class ModelsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      @models = Model.all
      filter_by_greater_price
      filter_by_lower_price

      render json: @models, status: :ok
    end

    def create
      begin
        model = Model.new(create_model_params)
        model.brand = Brand.find(params[:id])
        if model.save
          render json: model, status: :ok
        else
          render json: { error: model.errors }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Brand not found" }, status: :not_found
      end
    end

    def update
      begin
        model = Model.find(params[:id])

        if model.update(update_model_params)
          render json: model, status: :ok
        else
          render json: { error: model.errors }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Model not found" }, status: :not_found
      end
    end

    private

    def create_model_params
      params.require(:model).permit(:name, :average_price)
    end

    def update_model_params
      params.require(:model).permit(:average_price)
    end

    def filter_by_greater_price
      return unless params[:greater].present?
      
      greater_price = params[:greater].to_i
  
      @models = @models.where("average_price > ?", greater_price)
    end

    def filter_by_lower_price
      return unless params[:lower].present?

      lower_price = params[:lower].to_i
  
      @models = @models.where("average_price < ?", lower_price)
    end
  end
end