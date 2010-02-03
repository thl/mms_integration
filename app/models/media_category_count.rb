class MediaCategoryCount < MediaManagementResource
  self.site = "#{self.site.to_s}categories/:category_id/"
  self.element_name = 'count'
end