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
		if !params[:marker][:time]
			@marker.time = Time.now
		end 
		@marker.save
		render :text => "Marker created"
	end	
end
