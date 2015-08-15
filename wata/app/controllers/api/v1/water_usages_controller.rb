module Api
  module V1
    class WaterUsagesController < ApplicationController
      def index
        @water = WaterUsage.all
      end
      def show
        @water = WaterUsage.find(params[:id])
      end
      def create
        @water = WaterUsage.create(water_params)
        if @water.save
          render json: @water
        else
          render json: "bad request", status: 422
        end
      end
      private
      def water_params
        params.require(:water_usage).permit(:moisture, :longitude, :latitude, :moisture_float)
      end
    end
  end
end
