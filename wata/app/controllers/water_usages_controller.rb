class WaterUsagesController < ApplicationController
	def index
		@water = WaterUsage.all.reverse
	end
end
