class Driver < ActiveRecord::Base
	has_many :journeys, :order => 'created_at DESC'

	def recent_journeys
		journeys.find(:all, :limit => 10)
	end

	def most_recent_open_journey
		journeys.select{|j| j.finished_at == nil }[0]
	end	

	def close_recent_journey
		if j = most_recent_journey
			j.finished_at = Time.now
			j.save
		end
	end

	def most_recent_journey
		journeys.find(:first)
	end

	def most_recent_marker
		if j = most_recent_open_journey
			j.markers.find(:first)
		end
	end
end
