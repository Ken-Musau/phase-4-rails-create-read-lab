class PlantsController < ApplicationController
  wrap_parameters format: []
  #    GET /plants
  def index
    render json: Plant.all, status: :ok
  end

  def show
    plant = Plant.find_by(id: params[:id])
    if plant
      render json: plant, status: :ok
    else
      render json: { error: "plant not found" }, status: :not_found
    end
  end

  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  def update
    plant = Plant.find_by(id: params[:id])
    if plant
      plant.update(plant_params)
      render json: plant, status: :accepted
    else
      render json: { error: "Plant not found" }, status: :not_found
    end
  end

  private

  def plant_params
    params.permit(:name, :image, :price)
  end
end
