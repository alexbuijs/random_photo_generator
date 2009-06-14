namespace :db do
  desc 'Recreate the database, migrate and initialize with the seed data'
  task :setup => [ 'db:drop', 'db:create', 'db:migrate', 'db:seed' ]

  desc 'Load the seed data from db/seeds.rb'
  task :seed => :environment do
    seed_file = File.join(Rails.root, 'db', 'seeds.rb')
    load(seed_file) if File.exist?(seed_file)
  end
end