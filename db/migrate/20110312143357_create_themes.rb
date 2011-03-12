class CreateThemes < ActiveRecord::Migration
  def self.up
    create_table :themes do |t|
      t.string :title
      t.string :slug
      t.boolean :default, :default => false
      t.string :status, :default => :active
      t.timestamps
    end
  end

  def self.down
    drop_table :themes
  end
end
