# -*- coding: utf-8 -*-
require 'spec_helper'

describe TdiaryAmazonPluginWrapper do
  it "without image" do
    html = TdiaryAmazonPluginWrapper.new.isbn_image("4906470068")
    html.must_match(%r!\A<a href="http://www\.amazon\.co\.jp/.*/dp/4906470068%3F.*"><img class="amazon" src="http://www\.tdiary\.org/images/amazondefaults/medium\.png"\nheight="160" width="122" alt="">\n.*</a>!)
  end

  it "with image" do
    html = TdiaryAmazonPluginWrapper.new.isbn_image("4774158798")
    html.must_match(%r!\A<a href="http://www\.amazon\.co\.jp/.*/dp/4774158798%3F.*"><img class="amazon" src="http://ecx\.images-amazon\.com/images/I/51K0jUf%2BiEL\._SL160_\.jpg"\nheight="160" width="126" alt="">\n.*</a>!)
  end

  it "countries" do
    TdiaryAmazonPluginWrapper.new.countries.sort.must_equal [
      'ca',
      'cn',
      'de',
      'es',
      'fr',
      'it',
      'jp',
      'uk',
      'us',
    ].sort
  end
end
