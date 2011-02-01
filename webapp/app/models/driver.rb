class Driver < ActiveRecord::Base
	has_many :journeys, :order => 'created_at DESC'

	def recent_journeys
		journeys.find(:all, :limit => 10)
	end

	def most_recent_journey
		journeys.find(:all, :limit => 1)[0]
	end

	def most_recent_marker
		most_recent_journey.markers.find(:all, :order => 'time DESC', :limit => 1)[0]
	end
end
