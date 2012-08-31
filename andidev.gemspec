# -*- encoding: utf-8 -*-
require File.expand_path('../lib/andidev/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Anders Steiner"]
  gem.email         = ["anders.steiner@gmail.com"]
  gem.description   = %q{Andidev's development toolbox}
  gem.summary       = %q{Andidev's development toolbox}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "andidev"
  gem.require_paths = ["lib"]
  gem.version       = Andidev::VERSION
end
