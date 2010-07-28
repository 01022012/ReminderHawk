class CreateReminders < ActiveRecord::Migration
  def self.up
    create_table :reminders do |t|
      t.integer   :event_id
      t.integer   :duration
      t.integer   :unit
      t.datetime  :remind_at
      t.timestamps
    end
  end

  def self.down
    drop_table :reminders
  end
end
