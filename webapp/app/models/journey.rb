class Journey < ActiveRecord::Base
	belongs_to :driver
	has_many   :markers, :order => 'time DESC'

	def recent_markers
		markers.find(:all, :limit => 10)
	end

	def finished_at_str
		finished_at ? finished_at : "in progress"
	end
end
