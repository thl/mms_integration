module MmsIntegration
  class Title < MediaManagementResource
    self.site = "#{self.site.to_s}media_objects/:medium_id/"
  end
end