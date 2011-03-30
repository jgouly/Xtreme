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

	def journey_js
		@journey = Journey.find params[:id]
		render :action => 'journey_js', :content_type => 'text/javascript'
	end

	def add_marker
		@marker = Marker.new params[:marker]
		@driver = Driver.find params[:driver_id]
		if !params[:marker][:time]
			@marker.time = Time.now
		else
			@marker.time = Time.at(params[:marker][:time].to_i/1000)
		end
		if j = @driver.most_recent_open_journey 
			@marker.journey = j
			@marker.save
		end
		render :text => "Marker created"
	end

	def new_journey
		@driver = Driver.find params[:id]
		@driver.close_recent_journey
		@driver.journeys.create
		render :text => "New Journey"
	end

	def end_journey
		@driver = Driver.find params[:id]
		@driver.close_recent_journey
		render :text => "Journey finished"
	end

	def index_js
		@drivers = Driver.find :all
		render :action => 'index_js', :content_type => "text/javascript" 
	end	
end
