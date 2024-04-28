$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "zenti/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "zenti"
  s.version     = Zenti::VERSION
  s.authors     = ["Atom Labs"]
  s.email       = ["waylon@atomlabs.com"]
  s.homepage    = "https://github.com/atom-labs/zenti-ruby"
  s.summary     = "A Ruby wrapper for the Zenti API"
  s.description = "A Ruby wrapper for the Zenti API"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rest-client', '~> 2'
end
