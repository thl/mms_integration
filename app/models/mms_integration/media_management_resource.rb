module MmsIntegration
  class MediaManagementResource < ActiveResource::Base
    case InterfaceUtils::Server.environment
    when InterfaceUtils::Server::DEVELOPMENT
      self.site = 'http://127.0.0.1/'
      headers['Host'] = 'dev-mms.thlib.org'
    when InterfaceUtils::Server::STAGING
      self.site = 'http://127.0.0.1/'
      headers['Host'] = 'staging.mms.thlib.org'
    when InterfaceUtils::Server::PRODUCTION
      self.site = 'http://127.0.0.1/'
      headers['Host'] = 'mms.thlib.org'
    when InterfaceUtils::Server::LOCAL
      self.site = 'http://localhost/mms/'
    when InterfaceUtils::Server::EBHUTAN
      self.site = 'http://www.e-bhutan.net.bt/mms/'
    else
      self.site = 'http://mms.thlib.org/'
    end

    self.timeout = 100
    self.format = :xml
  end
end