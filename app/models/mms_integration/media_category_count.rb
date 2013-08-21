module MmsIntegration
  class MediaCategoryCount < ActiveResource::Base
    headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?
    self.site = "#{MediaManagementResource.site.to_s}categories/:category_id/"
    self.element_name = 'count'
    self.format = :xml
  end
end