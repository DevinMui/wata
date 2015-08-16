class WaterUsagesController < ApplicationController
	def index
		@water = WaterUsage.all
	end
end
