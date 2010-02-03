class MediaManagementResource < ActiveResource::Base
  hostname = Socket.gethostname.downcase
  if hostname == 'sds6.itc.virginia.edu'
    self.site = 'http://staging.mms.thdl.org/'
  elsif hostname == 'dev.thlib.org'
    self.site = 'http://dev.mms.thlib.org/'
  else
    self.site = 'http://mms.thlib.org/' # 'http://localhost/stable/mms/'
  end
  self.timeout = 100
end