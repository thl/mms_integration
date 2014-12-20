module MmsIntegration
  class Video < Medium
    headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?
  end
end