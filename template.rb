run 'cp /dev/null README.md'
run "echo '/vendor/bundle' >> .gitignore"

gsub_file 'Gemfile', /^.*web-console.*$/ , ''
gsub_file 'Gemfile', /^.*byebug.*$/ , ''
gsub_file 'Gemfile', /^.*jbuilder.*$/ , ''
gsub_file 'Gemfile', /^.*coffee-rails.*$/ , ''
gsub_file 'Gemfile', /^.*therubyracer.*$/ , ''
gsub_file 'Gemfile', /^.*tzinfo-data.*$/ , ''

gem_group :development, :test do
  gem 'dotenv-rails'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'view_source_map'
  gem 'awesome_print'
end

run 'bundle install --without production'

rake 'db:create'
rake 'db:migrate'

git :init
git add: '.'
git commit: "-m 'Initial commit'"
