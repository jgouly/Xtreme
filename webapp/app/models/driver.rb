class Driver < ActiveRecord::Base
	has_many :journeys, :order => 'created_at DESC'

	def recent_journeys
		journeys.find(:all, :limit => 10)
	end

	def most_recent_marker
		journeys.find(:all, :limit => 1)[0].markers.find(:all, :order => 'time DESC', :limit => 1)[0]
	end
end
