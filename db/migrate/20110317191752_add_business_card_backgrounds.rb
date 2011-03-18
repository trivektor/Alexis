class AddBusinessCardBackgrounds < ActiveRecord::Migration
  def self.up
    
    business_cards = BusinessCard.find(:all)
    
    business_cards.each do |business_card|
      business_card.business_card_background = BusinessCardBackground.new
      business_card.business_card_background.save
    end
  end

  def self.down
  end
end
