require File.expand_path('../lib/version', __FILE__)

Gem::Specification.new do |gem|
  gem.version       = Onepay::VERSION
  gem.authors       = ['sundbcn@gmail.com']
  gem.email         = ['sundbcn@gmail.com']
  gem.description   = 'onepay'
  gem.summary       = 'onepay'
  gem.homepage      = 'http://github.com/sundebing'

  gem.files         = Dir['{lib}/**/*']
  gem.name          = 'onepay'
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'alipay'
  gem.add_runtime_dependency 'rest-client', '>= 2.0.0'
end
