class CreateBusinessCards < ActiveRecord::Migration
  def self.up
    create_table :business_cards do |t|
      t.integer :user_id
      t.string :url
      t.string :title
      t.timestamps
    end
  end

  def self.down
    drop_table :business_cards
  end
end
