class AddThemes < ActiveRecord::Migration
  def self.up
    Theme.create(:title => 'Paint brush', :slug => 'paint_brush')
    Theme.create(:title => 'Tea house', :slug => 'tea_house')
    Theme.create(:title => 'Paper crane', :slug => 'paper_crane')
    Theme.create(:title => 'Show mask', :slug => 'show_mask')
    Theme.create(:title => 'Bonsai', :slug => 'bonsai')
    Theme.create(:title => 'Office 1', :slug => 'office_1')
    Theme.create(:title => 'Office 2', :slug => 'office_2')
    Theme.create(:title => 'Lamborghini', :slug => 'lamborghini')
    Theme.create(:title => 'Samurai', :slug => 'samurai')
    Theme.create(:title => 'Shirt n Tie', :slug => 'shirt_n_tie')
    Theme.create(:title => 'Photographer', :slug => 'photographer')
    Theme.create(:title => 'Ruby', :slug => 'ruby')
  end

  def self.down
  end
end
