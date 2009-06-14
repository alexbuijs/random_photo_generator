namespace :asset_cache do
  desc "Clears javascripts/cache and stylesheets/cache"
  task :clear do
    FileUtils.rm(Dir['public/javascripts/cache/[^.]*'])
    FileUtils.rm(Dir['public/stylesheets/cache/[^.]*'])
  end
end