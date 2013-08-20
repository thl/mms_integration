module MmsIntegration
  class Title < MediaManagementResource
    headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?
    self.site = "#{self.site.to_s}media_objects/:medium_id/"
  end
end