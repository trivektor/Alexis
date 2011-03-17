class AddProvinceStateCountryCodeZipCityToVisitorInfos < ActiveRecord::Migration
  def self.up
    add_column :visitor_infos, :province, :string, :after => :ip_address
    add_column :visitor_infos, :state, :string, :after => :province
    add_column :visitor_infos, :country_code, :string, :after => :state
    add_column :visitor_infos, :zip, :string, :after => :country_code
    add_column :visitor_infos, :city, :string, :after => :zip
  end

  def self.down
    remove_column :visitor_infos, :province
    remove_column :visitor_infos, :state
    remove_column :visitor_infos, :country_code
    remove_column :visitor_infos, :zip
    remove_column :visitor_infos, :city
  end
end
