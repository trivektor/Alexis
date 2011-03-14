module ProfilesHelper
  
  def generate_profile_location(profile)
    location = []
    
    location << profile.city unless profile.city.blank?
    location << profile.state unless profile.state.blank?
    location << profile.country unless profile.country.blank?
    
    location.join(', ')
    
  end
  
end
