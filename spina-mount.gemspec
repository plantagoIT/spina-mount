$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'spina/mount/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'spina-mount'
  s.version     = Spina::Mount::VERSION
  s.authors     = ['Aeneas Meier']
  s.email       = ['info@plantago.dev']
  s.homepage    = 'https://plantago.dev'
  s.summary     = 'Spina Model Extension'
  s.description = 'Extension for Mounting Custom Rails Models into the Spina CMS'
  s.licenses    = ['GPLv3']

  s.files = Dir['{app,config,db,lib,test}/**/*'] + ['Rakefile', 'README.md']

  s.add_dependency 'spina'
end
