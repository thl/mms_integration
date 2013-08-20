module MmsIntegration
  class Workflow < MediaManagementResource
    headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?
    self.site = "#{self.site.to_s}media_objects/:medium_id/"
    self.collection_name = 'workflow'
  end
end