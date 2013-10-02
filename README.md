# TdiaryAmazonPluginWrapper

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'tdiary_amazon_plugin_wrapper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tdiary_amazon_plugin_wrapper

## Usage

```ruby
amazon = TdiaryAmazonPluginWrapper.new
puts amazon.isbn_image_left "asin", "comment"
puts amazon.isbn_detail "asin"
```

see http://docs.tdiary.org/?amazon.rb for more details.

### Rails

In controller:

```ruby
  helper TdiaryAmazonPluginWrapper::AmazonHelper
```

In view:

* `<%= amazon_img(isbn) %>`
* `<%= amazon_img_right(isbn) %>`
* `<%= amazon_img_left(isbn) %>`
* `<%= amazon.isbn_detail(isbn) %>`
* etc.

In config/initializers/tdiary_amazon_plugin_wrapper.rb:

```ruby
TdiaryAmazonPluginWrapper::DEFAULT_CONF.update({
  #'amazon.aid' => 'znz-22', # Amazon Associates ID
  'amazon.default_image_base' => '/assets/amazon/',
})
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Maintenance

### Update upstream files

* Run `thor update_plugin`

### Generate fallback images

1. Download [mplus-outline-fonts](http://mplus-fonts.sourceforge.jp/mplus-outline-fonts/download/index.html)
2. Extract it
3. Make symlink (`ln -sf /path/to/mplus-TESTFLIGHT-056/mplus-1c-black.ttf font.ttf`)
   or copy to `font.ttf`
4. Run `thor default_images`

## LICENSE

The files under misc are GPL-2 from tdiary-core.
And other files are MIT.
