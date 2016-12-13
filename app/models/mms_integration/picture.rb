module MmsIntegration
  class Picture < MediaManagementResource
    headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?
    
    acts_as_indexable path: 'asset_path', uid_prefix: MediaManagementResource.service, scope: {asset_type: 'picture', service: service}
    
    PER_PAGE = 20 # Number of elements displayed on grid

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
    
    # Expected options: page, per_page
    def self.search_by_place(fid, options = {})
      options.empty? ? self.search_by("kmapid:places-#{fid}") : self.paginate(options.merge(query: "kmapid:places-#{fid}"))
    end
    
    private
    
    def default_thumbnail
      'essay'
    end
  end
end