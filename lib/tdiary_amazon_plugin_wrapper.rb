require "tdiary_amazon_plugin_wrapper/version"
require 'erb'
if defined?(::Rails)
  require "tdiary_amazon_plugin_wrapper/engine"
end

class TdiaryAmazonPluginWrapper
  include ERB::Util

  autoload :AmazonHelper, "tdiary_amazon_plugin_wrapper/amazon_helper"

  DEFAULT_CONF = {
    'amazon.imgsize' => 1, # Medium
  }

  def initialize(conf={}, options={})
    conf = DEFAULT_CONF.merge(conf)
    @conf = DummyConf.new.merge(conf)
    @options = options
    @cache_path = self.class.cache_path
    @mode = 'day'
    @cgi = DummyCGI.new
    # load plugins
    %w"ja/amazon.rb amazon.rb".each do |plugin_path|
      path = File.expand_path("../../misc/plugin/#{plugin_path}", __FILE__)
      eval(File.read(path), binding, path, 1)
    end
  end

  def add_conf_proc(key, label, genre=nil, &block)
    # ignore
  end

  @@cache_path = nil

  def self.cache_path=(cache_path)
    @@cache_path = cache_path
  end

  def self.cache_path
    return @@cache_path if @@cache_path
    if defined?(Rails)
      @@cache_path = Rails.root + 'tmp'
    else
      require 'tmpdir'
      @@cache_path = Dir.tmpdir
    end
  end

  class DummyConf < Hash
    def secure
      false
    end

    # use UTF-8 only, so do nothing
    def to_native(str, charset=nil)
      str
    end
  end

  class DummyCGI
    def smartphone?
      false
    end
  end
end
