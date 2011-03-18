class BusinessCardTheme < ActiveRecord::Base
  
  belongs_to :business_card
  
  def self.create_business_card_theme(business_card)
    
    default_theme = Theme.get_default_theme
    
    business_card.business_card_theme = BusinessCardTheme.new(:theme_id => default_theme.id)
    business_card.business_card_theme.save
  end
  
end
