class MediaPlaceCount < ActiveResource::Base
  headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?
  self.site = "#{MediaManagementResource.site.to_s}places/:place_id/"
  self.element_name = 'count'
end