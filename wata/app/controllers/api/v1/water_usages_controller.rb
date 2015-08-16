module Api
  module V1
    class WaterUsagesController < ApplicationController
      def index
        @water = WaterUsage.all
        render json: @water
      end
      def show
        @water = WaterUsage.find(params[:id])
        render json: @water
      end
      def create
        @water = WaterUsage.create(water_params)
        respond_to do |format|
          if @water.save
            format.json { render json: @water }
            format.js
          else
            render json: "bad request", status: 422
          end
        end
      end
      private
      def water_params
        params.require(:water_usage).permit(:moisture, :longitude, :latitude, :moisture_float)
      end
    end
  end
end
