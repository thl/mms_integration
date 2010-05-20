class Document < MediaManagementResource
  headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?
  
  def prioritized_title
    titles = self.title
    if titles.instance_of?(Array)
      title = titles.first
    else
      title = titles
    end
    title.title
  end
  
  def self.find_by_title(title)
    self.find(:first, :params => {:title => title})
  end
  
  def self.find_by_original_medium_id(id)
    self.find(:first, :params => {:original_medium_id => id})
  end
end