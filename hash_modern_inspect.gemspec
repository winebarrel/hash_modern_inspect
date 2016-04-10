# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = 'hash_modern_inspect'
  spec.version       = '0.1.0'
  spec.authors       = ['winebarrel']
  spec.email         = ['sgwr_dts@yahoo.co.jp']

  spec.summary       = %q{Inspect Hash object as modern format.}
  spec.description   = %q{Inspect Hash object as modern format.}
  spec.homepage      = 'https://github.com/winebarrel/hash_modern_inspect'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.2'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
