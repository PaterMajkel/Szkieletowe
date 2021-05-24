class ProductshopController < ApplicationController
  def create
    price=999999999
    @shops=Shop.all
    @shops.each do |shop|
      Product.all.each do |product|
        case shop.id
        when 1
          url="https://mediamarkt.pl/search?query%5Bmenu_item%5D=&query%5Bquerystring%5D=#{product.name.gsub(' ','+')}"
          #url+=product.name.gsub(' ','+')
          doc = Nokogiri::HTML(URI.open(url))
          pricebox = doc.css("div.m-priceBox_price").first
          if pricebox.nil?
            price=999999999
          else
            price=pricebox.text.gsub(/\s+/,'')
            price.gsub(/[()-+.]/,'')
            price.gsub(/[,]/,'.')
            price.tr('^0-9.', '')
            price=price.to_f
          end

          @productshops=ProductShop.new(shop_id: shop.id, product_id: product.id, price: price, date: Time.now)
          @productshops.save
        end


      end

    end
    redirect_to request.referrer
  end


end
