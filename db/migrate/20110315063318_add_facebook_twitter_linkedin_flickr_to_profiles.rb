class AddFacebookTwitterLinkedinFlickrToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :facebook, :string, :after => :about_me
    add_column :profiles, :twitter, :string, :after => :facebook
    add_column :profiles, :linked_in, :string, :after => :twitter
    add_column :profiles, :dribble, :string, :after => :linked_in
    add_column :profiles, :gowalla, :string, :after => :dribble
    add_column :profiles, :forrst, :string, :after => :gowalla
    add_column :profiles, :quora, :string, :after => :forrst
    add_column :profiles, :foursquare, :string, :after => :quora
    add_column :profiles, :flickr, :string, :after => :foursquare
  end

  def self.down
    [:facebook, :twitter, :linked_in, :dribble, :gowalla, :forrst, :quora, :foursquare].each do |column|
      remove_column :profiles, column
    end
  end
end
