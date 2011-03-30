class Journey < ActiveRecord::Base
	belongs_to :driver
	has_many   :markers, :order => 'time DESC'

	def recent_markers
		markers.find(:all, :limit => 10)
	end

	def finished_at_str
		finished_at ? finished_at : "in progress"
	end

	def max_speed
		sigfig(to_mph(marker_speeds.max))
	end

	def avg_speed
		ms = marker_speeds
		sigfig(to_mph(ms.sum / ms.size))
	end

	def marker_speeds
		markers.map{|m| m.speed}
	end

	def score
		markers.inject(0){|t, m| t += m.speed > 50 ? 5 : m.speed < 10 ? 1 : 0 }
	end

	def to_mph(speed)
		speed * 2.23693629
	end

	def sigfig(speed)
		(100.0*speed).round/100.0
	end
end
