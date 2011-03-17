class AddThemes2 < ActiveRecord::Migration
  def self.up
    Theme.create(:title => "Chemistry", :slug => "chemist")
    Theme.create(:title => "Geography", :slug => "geography")
    Theme.create(:title => "Charts", :slug => "charts")
  end

  def self.down
  end
end
