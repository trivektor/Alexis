module BusinessCardsHelper
  
  def convert_timestamp_to_date(timestamp)
    return timestamp.strftime("%b %d, %Y %H:%M %p")
  end
  
end
