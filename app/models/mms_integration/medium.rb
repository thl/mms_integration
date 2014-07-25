module MmsIntegration
  class Medium < MediaManagementResource
    headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?
    self.element_name = 'media_object'

    # Using nested active resource. This is problematic when caching
    def category_ids
      self.associated_categories.collect{ |c| c.id }
    end

    # Using nested active resource. This is problematic when caching
    def feature_ids
      self.associated_features.collect{ |c| c.fid }
    end
    
    # Using nested active resource. This is problematic when caching
    def prioritized_title
      first = self.titles.first
      return first.nil? ? self.id : first.title
    end
    
    def web_url
      return nil if self.type != 'OnlineResource'
      web_address = self.web_address
      return '' if web_address.nil?
      url = web_address.url
      url.nil? ? '' : url
    end
  end
end