class ProductshopController < ApplicationController
  def create
    Shop.each do |shop|
      Product.each do |product|
        case shop.id
        when 1
          url="https://mediamarkt.pl/search?query%5Bmenu_item%5D=&query%5Bquerystring%5D=#{CGI.escape(product.name.gsub(' ','+'))}"
          doc = Nokogiri::HTML(open(url))
          pricebox = doc.css("div.m-priceBox_price").first
          if price.nil?
            price=999999999
          else
            price=pricebox.text.gsub(/\s+/,'')
            price.gsub(/[()-+.]/,'')
            price.tr('^0-9', '')
          end

          @productshops=ProductShop.New(shop_id: shop.id, product_id: product.id, price: price, date: Time.now)
          @productshops.save
      end

      end

    end
      
  end

end
