class AddAboutMeToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :about_me, :text, :after => :gender
  end

  def self.down
    remove_column :profiles, :about_me
  end
end
