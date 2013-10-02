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

  desc "default_images", "generate default images using imagemagick"
  def default_images
    if File.exist?('font.ttf')
      font = "-font font.ttf"
    end
    [
      {
        name: "large",
        height: 500,
        width: 380,
      },
      {
        name: "small",
        height: 75,
        width: 57,
      },
      {
        name: "medium",
        height: 160,
        width: 122,
      },
    ].each do |opt|
      run "convert -background white -fill gray #{font} -size #{opt[:width]}x#{opt[:height]} -gravity center label:'No\\nImage' vendor/assets/images/#{opt[:name]}.png"
    end
  end
end
