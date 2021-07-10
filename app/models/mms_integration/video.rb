module MmsIntegration
  class Video < Medium
    acts_as_indexable path: 'asset_path', hostname: 'asset_hostname', uid_prefix: '*', scope: {asset_type: 'video'}
  end
end