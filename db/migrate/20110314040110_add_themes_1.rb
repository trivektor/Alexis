class AddThemes1 < ActiveRecord::Migration
  def self.up
    Theme.create(:title => 'Piggy Bank', :slug => 'piggy_bank', :status => :disabled)
    Theme.create(:title => 'Forklift', :slug => 'forklift', :status => :disabled)
    Theme.create(:title => 'Udon', :slug => 'udon', :status => :disabled)
  end

  def self.down
  end
end
