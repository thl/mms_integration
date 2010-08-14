class Medium < MediaManagementResource
  headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?
  self.element_name = 'media_object'
  
  def category_ids
    if self.associated_category.instance_of? Array
      return self.associated_category.collect{|c| c.id.to_i }
    else
      return [self.associated_category.id.to_i]
    end
  end
end