# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require 'easy/version'

Gem::Specification.new do |s|
  s.name        = 'easy-matchers'
  s.version     = Easy::Matchers::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Igor Zubkov']
  s.email       = %q{igor.zubkov@gmail.com}
  s.homepage    = %q{http://github.com/biow0lf/rspec-rails-matchers}
  s.summary     = %q{Extra RSpec matchers for Rails}
  s.description = %q{Extra RSpec matches for Rails (ActiveModel::Validators, ActiveModel::Model)}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'rake'
  s.add_dependency 'rails', '~> 4.2'
  s.add_dependency 'rspec', '~> 3.3'
end
