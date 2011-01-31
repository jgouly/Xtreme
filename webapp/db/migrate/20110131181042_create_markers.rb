class CreateMarkers < ActiveRecord::Migration
  def self.up
    create_table :markers do |t|
	t.float :long
	t.float :lat
	t.float :speed
	t.float :accln
	t.timestamp :time, :null => false
	t.integer :driver_id
    end
  end

  def self.down
    drop_table :markers
  end
end
