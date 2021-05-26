class ProductshopController < ApplicationController
  def create
    price = 2137
    @shops = Shop.all
    @shops.each do |shop|
      Product.all.each do |product|
        case shop.domain
        when "mediamarkt.pl"
          url = "https://mediamarkt.pl/search?query%5Bmenu_item%5D=&query%5Bquerystring%5D=#{product.name.gsub(' ', '+')}"
          #url+=product.name.gsub(' ','+')
          doc = Nokogiri::HTML(URI.open(url))
          pricebox = doc.css("div.m-priceBox_price").first
          if pricebox.nil?
            price = 2137.42
          else
            price = pricebox.text.gsub(/\s+/, '')
            price.gsub(/[()-+.]/, '')
            price.gsub(/[,]/, '.')
            price.tr('^0-9.', '')
            price = price.to_f
          end
        when "euro.com.pl"
          url = "https://www.euro.com.pl/search.bhtml?keyword=#{CGI.escape(product.serialcode.gsub(' ', '%20'))}"
          doc = Nokogiri::HTML(URI.open(url))
          pricebox = doc.css("div.product-price.selenium-price-normal").first
          if pricebox.nil?
            price = 2137.42
          else
            price = pricebox.text.gsub(/\s+/, '')
            price.gsub(/[()-+.]/, '')
            price.gsub(/[,]/, '.')
            price.tr('^0-9.', '')
            price = price.to_f
          end
        when "x-kom.pl"
          url = "https://www.x-kom.pl/szukaj?q=#{product.serialcode.gsub(' ', '%20')}"
          doc = Nokogiri::HTML(URI.open(url))
          pricebox = doc.css("span.sc-6n68ef-0.sc-6n68ef-3.hNZEsQ").first
          if pricebox.nil?
            price = 2137.42
          else
            price = pricebox.text.gsub(/\s+/, '')
            price.gsub(/[()-+.]/, '')
            price.gsub(/[,]/, '.')
            price.tr('^0-9.', '')
            price = price.to_f
          end
        when "mediaexpert.pl"
          url = "https://www.mediaexpert.pl/search?query[menu_item]=&query[querystring]=#{product.name.gsub(' ', '%20')}"
          doc = Nokogiri::HTML(URI.open(url))
          pricebox = doc.css("span.a-price_price").first
          if pricebox.nil?
            price = 2137.42
          else
            price = pricebox.text.gsub(/\s+/, '')
            price.gsub(/[()-+.]/, '')
            price.gsub(/[,]/, '.')
            price.tr('^0-9.', '')
            price = price.to_f
          end

        else
          next
        end
        if price != 2137.42
          @productshops = ProductShop.new(shop_id: shop.id, product_id: product.id, price: price, date: Time.now)
          @productshops.save
        end

      end
    end
    redirect_to request.referrer

  end


end
