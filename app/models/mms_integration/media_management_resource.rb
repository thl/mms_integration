module MmsIntegration
  class MediaManagementResource < ActiveResource::Base
    case InterfaceUtils::Server.environment
    when InterfaceUtils::Server::DEVELOPMENT
      self.site = 'https://dev-mms.thlib.org/'
    when InterfaceUtils::Server::PRODUCTION
      self.site = 'https://mms.thlib.org/'
      #when InterfaceUtils::Server::LOCAL
      #self.site = 'http://localhost/mms/'
    else
      self.site = 'https://mms.thlib.org/'
    end

    self.timeout = 100
    self.format = :xml
  end
end