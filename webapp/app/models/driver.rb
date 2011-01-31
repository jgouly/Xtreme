class Driver < ActiveRecord::Base
	has_many :markers

	def recent_markers
		markers.find(:all, :order => 'time DESC', :limit => 10)
	end

	def most_recent_marker
		markers.find(:all, :order => 'time DESC', :limit => 
1)[0]
	end
end
