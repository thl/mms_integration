class Document < MediaManagementResource
  headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?
  
  def prioritized_title
    titles = self.attributes['title']
    return self.id if titles.nil?
    return titles.first.title if titles.instance_of?(Array)
    return titles.title
  end
  
  def self.find_by_title(title)
    self.find(:first, :params => {:title => title})
  end
  
  def self.find_by_original_medium_id(id)
    self.find(:first, :params => {:original_medium_id => id})
  end
end