class AddTypeToBusinessCards < ActiveRecord::Migration
  def self.up
    add_column :business_cards, :card_type, :string, :default => :personal, :after => :title
  end

  def self.down
    remove_column :business_cards, :card_type
  end
end
