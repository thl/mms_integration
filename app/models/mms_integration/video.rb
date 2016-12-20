module MmsIntegration
  class Video < Medium
    headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?
    
    acts_as_indexable path: 'asset_path', uid_prefix: MediaManagementResource.service, scope: {asset_type: 'video', service: service}

  end
end