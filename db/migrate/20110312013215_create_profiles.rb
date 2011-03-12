class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code
      t.string :job_title
      t.string :website
      t.string :gender, :default => :male
      t.boolean :hidden, :default => false
      t.string :status, :default => :active
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
