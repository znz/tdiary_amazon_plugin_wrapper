require 'bundler'
require 'thor'

class Default < Thor
  include Thor::Actions

  desc "update_plugin", "update plugin files from tdiary-core"
  def update_plugin
    get "https://raw.github.com/tdiary/tdiary-core/master/LICENSE", "GPL-2"
    %w"amazon.rb ja/amazon.rb".each do |plugin_path|
      get "https://raw.github.com/tdiary/tdiary-core/master/misc/plugin/#{plugin_path}",
          "misc/plugin/#{plugin_path}"
    end
  end
end
