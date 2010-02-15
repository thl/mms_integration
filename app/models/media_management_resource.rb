class MediaManagementResource < ActiveResource::Base
  hostname = Socket.gethostname.downcase
  if hostname == 'sds6.itc.virginia.edu'
    self.site = 'http://127.0.0.1/'
    headers['Host'] = 'staging.mms.thlib.org'
  elsif hostname == 'dev.thlib.org'
    self.site = 'http://127.0.0.1/'
    headers['Host'] = 'dev.mms.thlib.org'
  elsif hostname.ends_with? 'local'
    self.site = 'http://localhost/master/mms/'
  elsif hostname =~ /sds[3-8].itc.virginia.edu/
    self.site = 'http://127.0.0.1/'
    headers['Host'] = 'mms.thlib.org'
  else
    self.site = 'http://mms.thlib.org/'
  end  
  self.timeout = 100
end