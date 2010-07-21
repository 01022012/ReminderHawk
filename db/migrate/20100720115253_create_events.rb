class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string  :title, :length => 140
      t.string  :subject, :length => 140
      t.datetime  :start
      t.datetime  :end
      t.boolean :repeat,  :default => false
      t.integer :user_id
      t.timestamps
      t.boolean :allDay, :default => false # For easy json conversion, using camelcase
    end
  end

  def self.down
    drop_table :events
  end
end
