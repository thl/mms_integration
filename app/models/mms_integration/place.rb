module MmsIntegration
  class Place < MediaManagementResource
    def self.paginated_media(id, media_type, options = {})
      hash = self.get("#{id}/#{media_type}", options.reject{|k,v| v.nil?})
      WillPaginate::Collection.create(hash['current_page'], hash['per_page'], hash['total_entries']) do |pager|
        pager.replace(hash['media'])
      end
    end
  end
end