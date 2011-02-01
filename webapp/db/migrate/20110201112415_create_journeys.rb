class CreateJourneys < ActiveRecord::Migration
  def self.up
    create_table :journeys do |t|
	  t.integer   :driver_id
      t.timestamp :created_at
	  t.timestamp :finished_at
    end
  end

  def self.down
    drop_table :journeys
  end
end
