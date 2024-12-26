# Draft Box

A web interface for browsing Ruby on Rails sent emails with support for distributed environments. The library is using database for storing e-mail messages and attachments to present them on the dedicated dashboard and work correctly with applications based on multiple workers.

## Getting started

Install the library and make it available for the development environment:

```ruby
group :development do
  gem "draft_box"
end
```

Run the generator to create migration files:

```bash
rails generate draft_box:install
```

Run migrations:

```bash
rails db:migrate
```

## Configuration

Edit `config/environments/development.rb` and ensure that you are using the right delivery method for emails:

```ruby
config.action_mailer.delivery_method = :draft_box
config.action_mailer.perform_deliveries = true
```

Add to `config/routes.rb`:

```ruby
Your::Application.routes.draw do
  mount DraftBox::Engine, at: "/draft_box" if Rails.env.development?
end
```
