class PlantsController < ApplicationController

    wrap_parameters format: {}

    # return all Plant instances
    def index
        plant = Plant.all
        if plant
            render json: plant, status: :ok
        else
            render json: {error: "data not found"}, status: :not_found
        end
    end

    # show only specific Plant instant
    def show
        plant = Plant.find(params[:id])
        if plant
            render json: plant, status: :ok
        else
            render json: {error: "data not found"}, status: :not_found
        end
    end

    # create new plant instant
    def create
        plant = Plant.create(new_plant)
        if plant
            render json: plant, status: :created
        else
            render json: {error: "error"}, status: :not_implemented
        end
    end

    #private method to allow verified params
    private

    def new_plant
        params.permit(:name, :image, :price)
    end
end
