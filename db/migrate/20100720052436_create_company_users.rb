class CreateCompanyUsers < ActiveRecord::Migration
  def self.up
    create_table :company_users do |t|
      t.integer :user_id
      t.integer :company_id
      t.boolean :admin, :default => false
      t.column :activation_code,           :string, :limit => 40
      t.column :activated_at,              :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :company_users
  end
end
