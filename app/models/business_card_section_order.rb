class BusinessCardSectionOrder < ActiveRecord::Base
  
  belongs_to :business_card
  
  def self.create_section_order(business_card)
    {
      :address => {:name => 'Address', :weight => 5}, 
      :email => {:name => 'Email', :weight => 4}, 
      :website => {:name => 'Website', :weight => 3}, 
      :phone_number => {:name => 'Telephone', :weight => 2}, 
      :fax_number => {:name => 'Fax', :weight => 1}
    }.each do |section, details|
      self.create(:business_card_id => business_card.id, :section => section, :name => details[:name], :weight => details[:weight])
    end
  end
  
end
