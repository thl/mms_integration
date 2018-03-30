module MmsIntegration
  class Medium < MediaManagementResource
    headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?
    self.element_name = 'media_object'

    PER_PAGE = 20 # Number of elements displayed on grid

    # Just expected to be called by the descendants of Medium
    # Expected options: page, per_page
    def self.search_by_kmapid(uid, options = {})
      options.empty? ? self.search_by("kmapid:#{uid}") : self.paginate(options.merge(query: "kmapid:#{uid}"))
    end

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
    
    def bibliographic_reference
      a = self.respond_to?(:photographer) ? [self.photographer.fullname] : []
      a << "<i>#{self.prioritized_title}</i>"
      s = a.join(', ')
      if self.respond_to? :publisher
        publisher = self.publisher
        a = publisher.respond_to?(:country) ? [publisher.country] : []
        a << publisher.title
        s2 = a.join(': ')
      else
        s2 = nil
      end
      a = s2.blank? ? [] : [s2]
      taken_on = self.respond_to?(:taken_on) ? self.taken_on : nil
      a << taken_on if !taken_on.blank?
      s2 = a.join(', ')
      s << " (#{s2})" if !s2.blank?
      return s.html_safe
    end
  end
end