namespace :scraper do
  desc 'using scraper'
  task :use => :environment do
    session = ActionDispatch::Integration::Session.new(Rails.application)
    session.get '/productshop/create'
  end
end
