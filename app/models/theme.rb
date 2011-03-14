class Theme < ActiveRecord::Base
  
  def self.get_default_theme
    
    default_theme = Theme.where(:default => true, :status => :active).first
    
    if default_theme.nil?
      default_theme = Theme.first
    end
      
    default_theme
    
  end
  
  def self.theme_applicable(theme_id)
    theme = Theme.where(:id => theme_id, :status => :active).first
    !theme.nil?
  end
  
end
