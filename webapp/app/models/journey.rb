class Journey < ActiveRecord::Base
	belongs_to :driver
	has_many   :markers, :order => 'time DESC'

	def recent_markers
		markers.find(:all, :limit => 10)
	end
end
