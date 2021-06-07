# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

desc 'Generate VAPID keys'
task :generate_vapid do
  require 'webpush'
  vapid_key = Webpush.generate_key

  # Save these in your application server settings
  vapid_key.public_key
  vapid_key.private_key

  # Or you can save in PEM format if you prefer
  vapid_key.to_pem
end