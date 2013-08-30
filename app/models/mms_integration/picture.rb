module MmsIntegration
  class Picture < MediaManagementResource
    headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?
    
    def url
      i = self.images.detect{|i| i.thumbnail=='compact'} #essay
      i.url if !i.nil?
    end
    
    def caption
      c = self.captions.first
      c.title if !c.nil?
    end
  end
end