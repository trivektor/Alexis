class AddStatusToBusinessCards < ActiveRecord::Migration
  def self.up
    add_column :business_cards, :status, :string, :after => :title, :default => :active
  end

  def self.down
    remove_column :business_cards, :status
  end
end
