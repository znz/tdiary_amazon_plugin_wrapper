# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tdiary_amazon_plugin_wrapper/version'

Gem::Specification.new do |spec|
  spec.name          = "tdiary_amazon_plugin_wrapper"
  spec.version       = TdiaryAmazonPluginWrapper::VERSION
  spec.authors       = ["Kazuhiro NISHIYAMA"]
  spec.email         = ["zn@mbf.nifty.com"]
  spec.description   = %q{tDiary amazon plugin use without tdiary, with rails etc.}
  spec.summary       = %q{tDiary amazon plugin without tdiary}
  spec.homepage      = ""
  spec.licenses      = ["MIT", "GPL-2"]

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
