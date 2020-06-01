module MmsIntegration
  class MediaCategoryCount < ActiveResource::Base
    self.site = "#{MediaManagementResource.site.to_s}categories/:category_id/"
    self.element_name = 'count'
    self.format = :xml
  end
end