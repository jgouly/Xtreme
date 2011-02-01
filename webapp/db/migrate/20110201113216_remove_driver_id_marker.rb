class RemoveDriverIdMarker < ActiveRecord::Migration
  def self.up
	remove_column :markers, :driver_id
  end

  def self.down
	add_column :markers, :driver_id, :integer
  end
end
