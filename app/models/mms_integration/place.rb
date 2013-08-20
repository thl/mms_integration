module MmsIntegration
  class Place < MediaManagementResource
    headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?
  end
end