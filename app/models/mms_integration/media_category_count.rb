module MmsIntegration
  class MediaCategoryCount < ActiveResource::Base
    self.site = "#{MediaManagementResource.site.to_s}categories/:category_id/"
    self.element_name = 'count'
    self.format = :xml
    self.ssl_options = MediaManagementResource.ssl_options
  end
end