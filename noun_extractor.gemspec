# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'noun_extractor/version'

Gem::Specification.new do |gem|
  gem.name          = "noun_extractor"
  gem.version       = NounExtractor::VERSION
  gem.authors       = ["yukihir0"]
  gem.email         = ["yukihiro.cotori@gmail.com"]
  gem.description   = %q{'noun_extractor' provides feature for japanese noun extraction from parse result of MeCab.}
  gem.summary       = %q{'noun_extractor' provides feature for japanese noun extraction from parse result of MeCab.}
  gem.homepage      = "http://github.com/yukihir0/noun_extractor"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
end
