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
  'amazon.aid' => 'znz-22', # replace your id if use
})
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Update upstream files

* `thor update_plugin`

## LICENSE

The files under misc are GPL-2 from tdiary-core.
And other files are MIT.
