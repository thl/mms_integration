module MmsIntegration
  class Picture < Medium
    acts_as_indexable path: 'asset_path', hostname: 'asset_hostname', uid_prefix: '*', scope: {asset_type: 'picture'}

    def image
      @image ||= self.images.detect{|i| i.thumbnail == default_thumbnail}
    end
    
    def url
      return nil if image.nil?
      @url ||= image.url
    end
    
    def width
      return nil if image.nil?
      @width ||= image.width.to_i
    end
    
    def height
      return nil if image.nil?
      @height ||= image.height.to_i
    end
    
    def place_id
      l = locations.first
      return nil if l.nil?
      @location ||= l.first.to_i
    end
    
    def caption
      c = self.captions.first
      return nil if c.nil?
      @caption ||= c.title
    end
        
    private
    
    def default_thumbnail
      'essay'
    end
  end
end