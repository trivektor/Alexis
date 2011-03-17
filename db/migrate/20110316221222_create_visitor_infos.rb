class CreateVisitorInfos < ActiveRecord::Migration
  def self.up
    create_table :visitor_infos do |t|
      t.integer :business_card_id
      t.string :browser
      t.string :version
      t.string :platform
      t.string :domain_name
      t.string :ip_address
      t.timestamps
    end
  end

  def self.down
    drop_table :visitor_infos
  end
end
