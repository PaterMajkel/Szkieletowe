# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

desc 'Generate VAPID keys'
task :generate_vapid do
  require 'webpush'
  vapid_key = Webpush.generate_key

  # Save these in your application server settings
  File.write('./vapid_keys/private_key', vapid_key.private_key)
  File.write('./vapid_keys/public_key', vapid_key.public_key)

  # Or you can save in PEM format if you prefer
  vapid_key.to_pem
end

task :generate_productshops => :environment do
  for i in (0..50)
    Product.all.each do |product|
      Shop.all.each do |shop|
        ProductShop.new(price: rand(1000..5000),product_id: product.id, shop_id: shop.id, date: Time.at(((Time.now.to_f / 3600).round - 50+i) * 3600)).save
    end


    end

  end
end
