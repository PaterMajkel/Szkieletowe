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
            price = 2137
          else
            price = pricebox.text.gsub(/\s+/, '')
            price=price.gsub(/[()-+.]/, '')
            price=price.gsub(/[,]/, '.')
            price=price.tr('^0-9.', '')
            price=price = price.to_f
          end
        when "euro.com.pl"
          url = "https://www.euro.com.pl/search.bhtml?keyword=#{CGI.escape(product.serial_code)}"
          if !product.serial_code.nil?
            url = "https://www.euro.com.pl/search.bhtml?keyword=#{CGI.escape(product.name)}"
          end
          doc = Nokogiri::HTML(URI.open(url))
          pricebox = doc.css("div.product-price.selenium-price-normal").first
          if pricebox.nil?
            pricebox = doc.css("div.price-normal.selenium-price-normal").first

          end
          if pricebox.nil?
            price = 2137
          else
            price = pricebox.text.gsub(/\s+/, '')
            price=price.gsub(/[()-+.]/, '')
            price=price.gsub(/[,]/, '.')
            price=price.tr('^0-9.', '')
            price = price.to_f
          end
        when "x-kom.pl"
          url = "https://www.x-kom.pl/szukaj?q=#{product.serial_code.gsub(' ', '%20')}"

          if !product.serial_code.nil?
            url = "https://www.x-kom.pl/szukaj?q=#{product.name.gsub(' ', '%20')}"
          else

          end
          doc
          begin
            doc = Nokogiri::HTML(URI.open(url))
          rescue Exception => exc
            logger.error("Message for the log file #{exc.message}")
            flash[:notice] = "x-kom nie poszedł"
            next

          end
          pricebox = doc.css("span.sc-6n68ef-0.sc-6n68ef-3.hNZEsQ").first
          if pricebox.nil?
            price = 2137
          else
            price = pricebox.text.gsub(/\s+/, '')
            price=price.gsub(/[()-+.]/, '')
            price=price.gsub(/[,]/, '.')
            price=price.tr('^0-9.', '')
            price = price.to_f
          end
        when "mediaexpert.pl"
          url = "https://www.mediaexpert.pl/search?query[menu_item]=&query[querystring]=#{product.name.gsub(' ', '%20')}"
          doc = Nokogiri::HTML(URI.open(url))
          pricebox = doc.css("span.a-price_price").first
          if pricebox.nil?
            price = 2137
          else
            price = pricebox.text.gsub(/\s+/, '')
            price=price.gsub(/[()-+.]/, '')
            price=price.gsub(/[,]/, '.')
            price=price.tr('^0-9.', '')
            price = price.to_f
          end
        when "amazon.pl"
          url = "https://www.amazon.pl/s?k=#{product.name.gsub(' ', '+')}"
          doc
          begin
            doc = Nokogiri::HTML(URI.open(url))
          rescue Exception => exc
            logger.error("Message for the log file #{exc.message}")
            flash[:notice] = "Amazon nie poszedł"
            next

          end

          pricebox = doc.css("span.a-price-whole").first
          priceboxfrac = doc.css("span.a-price-fraction").first
          if pricebox.nil?
            price = 2137
          else
            price1 = pricebox.text.gsub(/\s+/, '')
            price1 = price1.gsub(/[()-+.]/, '')
            price1 =  price1.gsub(/[,]/, '')
            price1 =  price1.tr('^0-9', '')

            price2 = priceboxfrac.text.gsub(/\s+/, '')
            price2 =price2.gsub(/[()-+.]/, '')
            price2 =price2.gsub(/[,]/, '')
            price2 =price2.tr('^0-9', '')


            price = price1.to_f + price2.to_f/100.00
          end

        else
          next
        end
        if price != 2137
          @productshops = ProductShop.new(shop_id: shop.id, product_id: product.id, price: price, date: Time.now)
          @productshops.save
        end

      end
    end
    redirect_to request.referrer

  end


end
