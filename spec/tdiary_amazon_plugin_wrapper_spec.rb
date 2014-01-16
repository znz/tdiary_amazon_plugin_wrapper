# -*- coding: utf-8 -*-
require 'spec_helper'

describe TdiaryAmazonPluginWrapper do
  it "without image" do
    amazon = TdiaryAmazonPluginWrapper.new
    html = amazon.isbn_image("4906470068")
    html.must_match(%r!\A<a href="http://www\.amazon\.co\.jp/.*/dp/4906470068%3F.*"><img class="amazon" src="http://www\.tdiary\.org/images/amazondefaults/medium\.png"\nheight="160" width="122" alt="">\n.*</a>!)
    assert_equal [], amazon.log
  end

  it "with image" do
    amazon = TdiaryAmazonPluginWrapper.new
    html = amazon.isbn_image("4774158798")
    html.must_match(%r!\A<a href="http://www\.amazon\.co\.jp/.*/dp/4774158798%3F.*"><img class="amazon" src="http://ecx\.images-amazon\.com/images/I/51K0jUf%2BiEL\._SL160_\.jpg"\nheight="160" width="126" alt="">\n.*</a>!)
    assert_equal [], amazon.log
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

  it "timeout" do
    require 'timeout'
    raises_exception = lambda {|sec| raise Timeout::Error }
    Timeout.stub :timeout, raises_exception do
      amazon = TdiaryAmazonPluginWrapper.new
      cache = File.join(Dir.tmpdir, "amazon", "jp0000000000.xml")
      FileUtils.rm_f(cache)
      detail_html = amazon.isbn_detail("0000000000")
      assert !File.exist?(cache)
      detail_html.must_match(%r!0000000000!)
      (error, message), = amazon.log
      assert_equal :error, error
      assert_equal "amazon.rb: Amazon API Timeouted.",  message
    end
  end
end
