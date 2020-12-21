Rails.application.routes.draw do
#page synamic avec 1 variable
  get 'dynamic_page/:first_name', to: 'dynamic_page#welcome'
#pages static
  get '/static_page/team', to: 'static_page#team'
  get '/static_page/contact', to: 'static_page#contact'
#page d'affichage d'un potin
  get '/page_show/show', to: 'page_show#show'
end
