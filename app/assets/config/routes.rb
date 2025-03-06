# config/routes.rb
Rails.application.routes.draw do
  # other routes

  # Search route
  get 'search', to: 'articles#search'
end
