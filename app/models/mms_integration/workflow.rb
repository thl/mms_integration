module MmsIntegration
  class Workflow < MediaManagementResource
    self.site = "#{self.site.to_s}media_objects/:medium_id/"
    self.collection_name = 'workflow'
  end
end