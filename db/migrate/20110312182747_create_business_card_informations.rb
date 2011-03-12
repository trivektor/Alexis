class CreateBusinessCardInformations < ActiveRecord::Migration
  def self.up
    create_table :business_card_informations do |t|
      t.integer :business_card_id
      t.string :name
      t.string :title
      t.string :email
      t.string :website
      t.string :phone_number
      t.string :fax_number
      t.string :address
      t.timestamps
    end
  end

  def self.down
    drop_table :business_card_informations
  end
end
