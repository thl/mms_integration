module MmsIntegration
  class MediaManagementResource < ActiveResource::Base
    case InterfaceUtils::Server.environment
    when InterfaceUtils::Server::DEVELOPMENT
      self.site = 'http://dev-mms.thlib.org/'
    when InterfaceUtils::Server::STAGING
      self.site = 'http://staging-mms.thlib.org/'
    when InterfaceUtils::Server::PRODUCTION
      self.site = 'http://mms.thlib.org/'
    when InterfaceUtils::Server::LOCAL
      self.site = 'http://localhost/mms/'
    else
      self.site = 'http://mms.thlib.org/'
    end

    self.timeout = 100
    self.format = :xml
  end
end