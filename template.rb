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

gsub_file 'Gemfile', /^.*web-console.*$/ , ''
gsub_file 'Gemfile', /^.*byebug.*$/ , ''
gsub_file 'Gemfile', /^.*jbuilder.*$/ , ''
gsub_file 'Gemfile', /^.*coffee-rails.*$/ , ''
gsub_file 'Gemfile', /^.*therubyracer.*$/ , ''
gsub_file 'Gemfile', /^.*tzinfo-data.*$/ , ''

gem 'slim-rails'

gem_group :development, :test do
  gem 'dotenv-rails'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'awesome_print'
end

run 'bundle install --without production --path vendor/bundle'

rake 'db:create'
rake 'db:migrate'

git :init
git add: '.'
git commit: "-m 'Initial commit'"
