class VisitorInfo < ActiveRecord::Base
  
  include GeoKit::Geocoders
  
  def self.update_analytics(business_card, request, geo_location)
    user_agent = UserAgent.parse(request.user_agent)
    
    if user_agent[0].product == 'Opera'
      browser = 'Opera'
    elsif !user_agent[2].nil? && user_agent[2].product == 'Chrome'
      browser = 'Chrome'
    elsif !user_agent[3].nil? && user_agent[3].product == 'Safari'
      browser = 'Safari'
    else
      browser = user_agent[2].product
    end
    
    location = IpGeocoder.geocode('12.215.42.19')
    
    business_card.visitor_infos.create(
      :browser => browser,
      :version => user_agent.version,
      :platform => user_agent[0].comment.join(" "),
      :ip_address => request.remote_addr, 
      :domain_name => request.host,
      :province => geo_location.province,
      :state => geo_location.state,
      :country_code => geo_location.country_code,
      :zip => geo_location.zip,
      :city => geo_location.city
    )
  end
  
  def self.get_browser_stats_by_business_card(business_card)
    self.where(:business_card_id => business_card.id).find(:all)
  end
  
  def self.get_browser_stats(visitor_infos)
    browsers = {}
    
    for info in visitor_infos
      if browsers.has_key?(info.browser)
        browsers[info.browser] += 1
      else
        browsers[info.browser] = 1
      end
    end
    
    browsers
  end
  
  def self.get_browser_version_stats(visitor_infos)
    versions = {}
    
    for info in visitor_infos
      if !versions.has_key?(info.browser)
        versions[info.browser] = {}  
      end
      
      if !versions[info.browser].has_key?(info.version)
        versions[info.browser][info.version] = 1
      else
        versions[info.browser][info.version] += 1
      end
      
    end
    
    versions
  end
  
  def self.get_platform_stats(visitor_infos)
    platforms = {}
    
    for info in visitor_infos
      if platforms.has_key?(info.platform)
        platforms[info.platform] += 1
      else
        platforms[info.platform] = 1
      end
    end
    
    platforms
  end
  
end
