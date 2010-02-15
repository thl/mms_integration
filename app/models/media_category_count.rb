class MediaCategoryCount < MediaManagementResource
  headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?
  self.site = "#{self.site.to_s}categories/:category_id/"
  self.element_name = 'count'
end