run 'cp /dev/null README.md'
run "echo '/vendor/bundle' >> .gitignore"

application  do
  %q{
    config.time_zone = 'Tokyo'

    config.generators do |generators|
      generators.assets false
      generators.helper false
      generators.stylesheets false
      generators.javascripts false
    end

    config.autoload_paths << "#{config.root}/app/services"  
  }
end

run 'bundle install --without production --path vendor/bundle'

rake 'db:create'
rake 'db:migrate'

git :init
git add: '.'
git commit: "-m 'Initial commit'"
