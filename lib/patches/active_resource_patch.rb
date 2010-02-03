module ActiveResource
  class Base
    class << self
      alias :old_find :find
      def find(*arguments)
        begin
          cache_key = ([name]+arguments.reject(&:nil?).collect{|arg| arg.to_s.strip}).reject(&:blank?).join('-')
          return Rails.cache.fetch(cache_key) { old_find(*arguments) }
        rescue ActiveResource::TimeoutError, ActiveResource::ResourceNotFound
          return nil
        end
      end
      
      private
      
      alias :old_find_single :find_single
      # Find a single resource from the default URL
      def find_single(scope, options)
        return nil if scope.nil?
        old_find_single(scope, options)
      end
    end
  end
end

class ActiveResource::Connection
  original_initialize=self.instance_method(:initialize)
  define_method :initialize do |*args|
    original_initialize.bind(self).call(*args)
    @default_header = {'Host'=>site.host}
    site.host='127.0.0.1'
  end if Socket.gethostname.downcase =~ /sds[3-8].itc.virginia.edu/
end