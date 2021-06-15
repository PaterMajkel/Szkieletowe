class ProductShop < ApplicationRecord
  belongs_to :product
  belongs_to :shop

  def self.scraper
    price = 2137
    puts 'check'
    return 'test'
    oldPrices=old_prices
    @shops = Shop.all
    @shops.each do |shop|
      Product.all.each do |product|
        case shop.domain
        when "mediamarkt.pl"
          url = "https://mediamarkt.pl/search?query%5Bmenu_item%5D=&query%5Bquerystring%5D=#{product.name.gsub(' ', '+')}"
          #url+=product.name.gsub(' ','+')
          begin
            doc = Nokogiri::HTML(URI.open(url))
          rescue Exception => exc
            logger.error("Message for the log file #{exc.message}")
            flash[:notice] = "Mediamarkt nie poszedł"
            next

          end
          pricebox = doc.css("div.m-priceBox_price").first
          if pricebox.nil?
            price = 2137
          else
            price = pricebox.text.gsub(/\s+/, '')
            price = price.gsub(/[()-+.]/, '')
            price = price.gsub(/[,]/, '.')
            price = price.tr('^0-9.', '')
            price = price.to_f
          end
        when "euro.com.pl"
          url = "https://m.euro.com.pl/search.bhtml?keyword=#{CGI.escape(product.name)}"

          if !product.serial_code.nil?
            url = "https://m.euro.com.pl/search.bhtml?keyword=#{CGI.escape(product.serial_code)}"
          end
          path=nil
          response = Net::HTTP.get_response(URI.parse(url))
          if response.code == "302"
            path = response['location'].split('|')[0]
          end
          if(!path.nil?)
            url="https://m.euro.com.pl#{path}"
          end

          begin
            doc = Nokogiri::HTML(URI.open(url))
          rescue Exception => exc
            logger.error("Message for the log file #{exc.message}")
            flash[:notice] = "Euro nie poszło"
            next
          end
          pricebox = doc.css("div.product-price.selenium-price-normal").first
          if pricebox.nil?
            pricebox = doc.css("div.price-normal.selenium-price-normal").first
          end
          if pricebox.nil?
            price = 2137
          else
            price = pricebox.text.gsub(/\s+/, '')
            price = price.gsub(/[()-+.]/, '')
            price = price.gsub(/[,]/, '.')
            price = price.tr('^0-9.', '')
            price = price.to_f
          end
        when "x-kom.pl"
          url = "https://www.x-kom.pl/szukaj?q=#{product.name.gsub(' ', '%20')}"
          if !product.serial_code.nil?
            url = "https://www.x-kom.pl/szukaj?q=#{product.serial_code.gsub(' ', '%20')}"
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
            price = price.gsub(/[()-+.]/, '')
            price = price.gsub(/[,]/, '.')
            price = price.tr('^0-9.', '')
            price = price.to_f
          end
        when "mediaexpert.pl"
          url = "https://www.mediaexpert.pl/search?query[menu_item]=&query[querystring]=#{product.name.gsub(' ', '%20')}"
          begin
            doc = Nokogiri::HTML(URI.open(url))
          rescue Exception => exc
            logger.error("Message for the log file #{exc.message}")
            flash[:notice] = "Media Expert nie poszło"
            next

          end
          pricebox = doc.css("span.a-price_price").first
          if pricebox.nil?
            price = 2137
          else
            price = pricebox.text.gsub(/\s+/, '')
            price = price.gsub(/[()-+.]/, '')
            price = price.gsub(/[,]/, '.')
            price = price.tr('^0-9.', '')
            price = price.to_f
          end

        when "oleole.pl"
          url = "https://m.oleole.pl/search.bhtml?keyword=#{CGI.escape(product.name)}"

          if !product.serial_code.nil?
            url = "https://m.oleole.pl/search.bhtml?keyword=#{CGI.escape(product.serial_code)}"
          end
          path=nil
          response = Net::HTTP.get_response(URI.parse(url))
          if response.code == "302"
            path = response['location'].split('|')[0]
          end
          if(!path.nil?)
            url="https://m.oleole.pl#{path}"
          end

          begin
            doc = Nokogiri::HTML(URI.open(url))
          rescue Exception => exc
            logger.error("Message for the log file #{exc.message}")
            flash[:notice] = "oleole nie poszło"
            next
          end
          pricebox = doc.css("div.product-price.selenium-price-normal").first
          if pricebox.nil?
            pricebox = doc.css("div.price-normal.selenium-price-normal").first
          end
          if pricebox.nil?
            price = 2137
          else
            price = pricebox.text.gsub(/\s+/, '')
            price = price.gsub(/[()-+.]/, '')
            price = price.gsub(/[,]/, '.')
            price = price.tr('^0-9.', '')
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
            price1 = price1.gsub(/[,]/, '')
            price1 = price1.tr('^0-9', '')

            price2 = priceboxfrac.text.gsub(/\s+/, '')
            price2 = price2.gsub(/[()-+.]/, '')
            price2 = price2.gsub(/[,]/, '')
            price2 = price2.tr('^0-9', '')

            price = price1.to_f + price2.to_f / 100.00
          end

        else
          next
        end
        if !price.nil?

          if price != 2137
            @productshops = ProductShop.new(shop_id: shop.id, product_id: product.id, price: price, date: Time.at((Time.now.to_f / 360).round * 360))
            @productshops.save
          end
        end

      end

    end
    newPrices = old_prices
    if(newPrices.nil?)
      return
    end
    oldPrices.each do |old|
      newPrices.each do |new|
        if(old.nil?)
          break
        else
          if(old.product_id==new.product_id)
            if(new.price<old.price)
              NowaCena.with(productshop: new).deliver(Product.where(id: new.product_id).first.users.all)
              break

            end
          end

        end
      end
    end

  end
  private
  def self.old_prices
    oldProductPrice=[]
    Product.all.each do |prod|
      item=ProductShop.where(product_id: prod.id).order(date: :desc,price: :asc).first
      oldProductPrice.append(item)

    end
    return oldProductPrice
  end
end
#gitdziala nareszcie
