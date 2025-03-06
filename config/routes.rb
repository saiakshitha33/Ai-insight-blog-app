Rails.application.routes.draw do
  # Set the root route to the home action in the PagesController
  root "pages#home"

  # Define routes for other pages
  get "home", to: "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  # Optionally, you can define a health check route
  get "up", to: "rails/health#show", as: "rails_health_check"
end
