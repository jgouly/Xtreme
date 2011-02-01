class AddJourneyIdToMarker < ActiveRecord::Migration
  def self.up
	add_column :markers, :journey_id, :integer
  end

  def self.down
	remove_column :markers, :journey_id
  end
end
