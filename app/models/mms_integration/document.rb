require_relative 'medium'

module MmsIntegration
  class Document < Medium
    acts_as_indexable path: 'asset_path', hostname: 'asset_hostname', uid_prefix: '*', scope: {asset_type: 'document'}

    def self.find_by_title(title)
      self.find(:first, :params => {:title => title})
    end

    def self.find_by_original_medium_id(id)
      self.find(:first, :params => {:original_medium_id => id})
    end
  end
end