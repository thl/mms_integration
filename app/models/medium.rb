class Medium < MediaManagementResource
  headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?
  self.element_name = 'media_object'
  
  def prioritized_title
    titles = self.title
    if titles.instance_of?(Array)
      title = titles.first
    else
      title = titles
    end
    title.title
  end
end