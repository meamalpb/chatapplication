# Usage
* Run `redis-server` in separate terminal
* Run `bundle`
* Run `rails g devise:install`
* Run `rails tailwindcss:install`
* Run `bundle exec rake secret` to create a secret
* Create a .env file in root folder and put the secret like this `SECRET_KEY=2f6fb5..`
* Run `rails db:schema:load`
* Run `rails db:seed`
* Run `rails s`