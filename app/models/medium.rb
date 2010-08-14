class Medium < MediaManagementResource
  headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?
  self.element_name = 'media_object'
  
  def category_ids
    begin
      if self.associated_category.instance_of? Array
        return self.associated_category.collect{|c| c.id.to_i }
      else
        return [self.associated_category.id.to_i]
      end
    rescue
      return []
    end
  end

  def feature_ids
    begin
      if self.associated_feature.instance_of? Array
        return self.associated_feature.collect{|c| c.fid.to_i }
      else
        return [self.associated_feature.fid.to_i]
      end
    rescue
      return []
    end
  end
end