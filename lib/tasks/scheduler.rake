
desc "Używa scrapera"
task :use_scraper => environment do
  ProductShop.scraper
end