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
    # Since its going as part of the url, space is not welcome on the rails side as a '+'. Should be %20 instead.
    self.find(:first, :params => {:title => title})
  end
end