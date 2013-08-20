module MmsIntegration
  class Document < MediaManagementResource
    headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?

    # Using nested active resource. This is problematic when caching
    def prioritized_title
      titles = self.attributes['title']
      return self.id if titles.nil?
      if titles.instance_of?(Array)
        elem = titles.first
      else
        elem = titles
      end
      return elem.instance_of?(Hash) ? elem['title'] : elem.title 
    end

    def self.find_by_title(title)
      self.find(:first, :params => {:title => title})
    end

    def self.find_by_original_medium_id(id)
      self.find(:first, :params => {:original_medium_id => id})
    end
  end
end