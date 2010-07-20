class CreateEventPhoneNumbers < ActiveRecord::Migration
  def self.up
    create_table :event_phone_numbers do |t|
      t.integer :event_id
      t.integer :phone_number_id
      t.timestamps
    end
  end

  def self.down
    drop_table :event_phone_numbers
  end
end
