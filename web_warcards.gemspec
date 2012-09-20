# -*- encoding: utf-8 -*-
require File.expand_path('../lib/web_warcards/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors     = ["Robie Lutsey"]
  gem.email       = ["robie1373@gmail.com"]
  gem.description = %q{Web front end to warcards}
  gem.summary     = %q{Runs warcards, only webbier!}
  gem.homepage    = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "web_warcards"
  gem.require_paths = ["lib"]
  gem.version       = WebWarcards::VERSION

  if RUBY_PLATFORM.match /darwin/i
    gem.add_development_dependency 'rb-fsevent', '~>0.9.1'
    gem.add_development_dependency 'growl', '~>1.0.3'
    gem.add_development_dependency 'firewatir'
    gem.add_development_dependency 'guard', '~>1.2.3'
    gem.add_development_dependency 'guard-minitest', '~>0.5.0'
    gem.add_development_dependency 'shotgun'
    gem.add_development_dependency 'turn', '~>0.9.6'
  elsif RUBY_PLATFORM.match /mswin/i
    gem.add_development_dependency 'watir'
  end
  gem.add_development_dependency 'sinatra-reloader'
  gem.add_development_dependency 'minitest-spec', '~>0.0.2'
  gem.add_development_dependency 'minitest-spec', '~>0.0.2'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'cucumber'
  gem.add_development_dependency 'watir-webdriver'
  gem.add_development_dependency 'nokogiri'

  gem.add_dependency 'bundler', "~>1.1"
  gem.add_dependency 'warcards', "~>0.0.7"
  gem.add_dependency 'rake', '~>0.9.2'
  gem.add_dependency 'sinatra', '~>1.3'
  gem.add_dependency 'thin', '~>1.4'
end
