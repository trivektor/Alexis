class CreateBusinessCardBackgrounds < ActiveRecord::Migration
  def self.up
    create_table :business_card_backgrounds do |t|
      t.integer :business_card_id
      t.string :background_color, :default => ''
      t.string :background_image, :default => 'noise.jpg'
      t.string :which, :default => 'image'
      t.timestamps
    end
    
  end

  def self.down
    drop_table :business_card_backgrounds
  end
end
