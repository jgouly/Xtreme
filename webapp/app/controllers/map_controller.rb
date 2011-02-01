class MapController < ApplicationController
	def index
		@drivers = Driver.find :all		
	end

	def driver
		@driver = Driver.find params[:id]
	end

	def marker
		@marker = Marker.find params[:id]
	end

	def journey
		@journey = Journey.find params[:id]
	end

	def add_marker
		@marker = Marker.new params[:marker]
		@driver = Driver.find params[:driver_id]
		if !params[:marker][:time]
			@marker.time = Time.now
		else
			@marker.time = Time.at(params[:marker][:time].to_i/1000)
		end 
		@marker.journey = @driver.most_recent_journey
		@marker.save
		render :text => "Marker created"
	end	
end
