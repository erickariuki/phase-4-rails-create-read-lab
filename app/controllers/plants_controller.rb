class PlantsController < ApplicationController
    wrap_parameters format: []
    def index
        plants = Plant.all
        render json: plants 
    end

    def show
        plants = Plant.all.find(params[:id])
        if plants
            render json: plants
        else
            render json: {error: "No plant found"}, status: :not_found
        end
    end

    def create 
        plants = Plant.create(plant_params)
        render json: plants, status: :created
    end

    private
    def plant_params
        params.permit(:name, :image, :price)
    end
end
