lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'draft_box/version'

Gem::Specification.new do |gem|
  gem.name        = 'draft_box'
  gem.version     = DraftBox::Version
  gem.date        = '2024-12-26'
  gem.summary     = "A web interface for browsing Ruby on Rails sent emails with support for distributed environments"
  gem.description = "A web interface for browsing Ruby on Rails sent emails with support for distributed environments"
  gem.authors     = ["Paweł Dąbrowski"]
  gem.email       = 'contact@paweldabrowski.com'
  gem.files       = Dir['lib/**/*.rb']
end
