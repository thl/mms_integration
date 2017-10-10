$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mms_integration/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mms_integration"
  s.version     = MmsIntegration::VERSION
  s.authors     = ["Andres Montano"]
  s.email       = ["amontano@virginia.edu"]
  s.homepage    = "http://mms.thlib.org"
  s.summary     = "Engine that facilitates connecting to the THL MMS app."
  s.description = "Engine that facilitates connecting to the THL MMS app."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 4.2.5'
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
