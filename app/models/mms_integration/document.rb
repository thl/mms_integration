require_relative 'medium'

module MmsIntegration
  class Document < Medium
    headers['Host'] = MediaManagementResource.headers['Host'] if !MediaManagementResource.headers['Host'].blank?

    def self.find_by_title(title)
      self.find(:first, :params => {:title => title})
    end

    def self.find_by_original_medium_id(id)
      self.find(:first, :params => {:original_medium_id => id})
    end
  end
end