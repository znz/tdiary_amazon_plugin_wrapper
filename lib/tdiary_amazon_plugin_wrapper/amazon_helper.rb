class TdiaryAmazonPluginWrapper
  module AmazonHelper
    def amazon(options={'amazon.imgsize'=>2})
      @amazon ||= TdiaryAmazonPluginWrapper.new(options)
    end

    def amazon_img(isbn)
      img = amazon.isbn_image_left(isbn).html_safe[/<img[^<>]*?>/]
      img ||= tag(:img, amazon.amazon_image(nil).update(alt: isbn))
      img = amazon_fixup_image_url(img)
      img.html_safe
    end

    def amazon_img_right(isbn)
      img = amazon.isbn_image_right(isbn)
      img = amazon_fixup_image_url(img)
      img.html_safe
    end

    def amazon_img_left(isbn)
      img = amazon.isbn_image_left(isbn)
      img = amazon_fixup_image_url(img)
      img.html_safe
    end

    def amazon_fixup_image_url(img)
      if amazon.conf['amazon.default_image_base'] == '/assets/amazon/'
        img.gsub(%r!"/assets/(amazon/(?:large|small|medium)\.png)"!) do |m|
          "\"#{image_path(m[/amazon.*\.png/])}\""
        end
      else
        img
      end
    end

    def isbn_detail(asin)
      html = amazon.isbn_detail(asin)
      html = amazon_fixup_image_url(html)
      html.html_safe
    end

    def isbn_image(asin, label='')
      html = amazon.isbn_image(asin, label)
      html = amazon_fixup_image_url(html)
      html.html_safe
    end
  end
end
