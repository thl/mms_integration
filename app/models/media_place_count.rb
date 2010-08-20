class MediaPlaceCount < MediaManagementResource
  headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?
  self.site = "#{self.site.to_s}places/:place_id/"
  self.element_name = 'count'
end