class CreateBusinessCardThemes < ActiveRecord::Migration
  def self.up
    create_table :business_card_themes do |t|
      t.integer :business_card_id
      t.integer :theme_id
      t.timestamps
    end
  end

  def self.down
    drop_table :business_card_themes
  end
end
