module MmsIntegration
  class Picture < MediaManagementResource
    headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?
    
    def image
      @image ||= self.images.detect{|i| i.thumbnail == default_thumbnail}
    end
    
    def url
      image.url if !image.nil?
    end
    
    def width
      @width ||= image.width.to_i if !image.nil?
    end
    
    def height
      @height ||= image.height.to_i if !image.nil?
    end
    
    def caption
      c = self.captions.first
      c.title if !c.nil?
    end
    
    private
    
    def default_thumbnail
      'essay'
    end
  end
end