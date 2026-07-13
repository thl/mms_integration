module MmsIntegration
  class MediaPlaceCount < ActiveResource::Base
    self.site = "#{MediaManagementResource.site.to_s}places/:place_id/"
    self.element_name = 'count'
    self.format = :xml
    self.ssl_options = MediaManagementResource.ssl_options
  end
end
