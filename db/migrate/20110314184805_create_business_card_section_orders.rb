class CreateBusinessCardSectionOrders < ActiveRecord::Migration
  def self.up
    create_table :business_card_section_orders do |t|
      t.integer :business_card_id
      t.string :section
      t.string :name
      t.integer :weight
      t.timestamps
    end
  end

  def self.down
    drop_table :business_card_section_orders
  end
end
