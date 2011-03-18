class CreateBackgroundColors < ActiveRecord::Migration
  def self.up
    create_table :background_colors do |t|
      t.string :hex_value
      t.string :status, :default => :active
      t.timestamps
    end
    
    ['9aabba', 'd4e1ee', 'c6c6c6', '9da4b7'].each do |color|
      BackgroundColor.create(:hex_value => color.upcase)
    end
    
  end

  def self.down
    drop_table :background_colors
  end
end
