class TruckController < ApplicationController
  def show
    begin
    puts "truck retrieving... "
    @truck = Truck.find(params[:id])
    render json: @truck

    rescue ActiveRecord::RecordNotFound => error
    puts "Object #{params[:id]} not found!"
    render json: {error: error}
    raise error
    end
  end

  def create
    puts "truck creating... "
    if @truck.save
      render json: @truck, status: :created
    else
      render json: @truck.errors, status: :unprocessable_entity
    end
  end
end
