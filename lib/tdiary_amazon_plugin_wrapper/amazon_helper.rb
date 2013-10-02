class TdiaryAmazonPluginWrapper
  module AmazonHelper
    def amazon(options={'amazon.imgsize'=>2})
      @amazon ||= TdiaryAmazonPluginWrapper.new(options)
    end

    def amazon_img(isbn)
      img = amazon.isbn_image_left(isbn).html_safe[/<img[^<>]*?>/]
      if img
        img.html_safe
      else
        tag(:img, amazon.amazon_image(nil).update(alt: isbn))
      end
    end

    def amazon_img_right(isbn)
      amazon.isbn_image_right(isbn).html_safe
    end

    def amazon_img_left(isbn)
      amazon.isbn_image_left(isbn).html_safe
    end
  end
end
