Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'


  get 'about', to: 'pages#about'

  get 'eastasia', to: 'pages#eastasia'
  get 'europe', to: 'pages#europe'
  get 'westasia', to: 'pages#westasia'
  get 'southandsoutheastasia', to: 'pages#southandsoutheastasia'
  get 'africanamerican', to: 'pages#africanamerican'
  get 'southandcentralamerica', to: 'pages#southandcentralamerica'
  get 'caribbean', to: 'pages#caribbean'
  get 'eastandwestafrica', to: 'pages#eastandwestafrica'
  get 'northsouthandcentralafrica', to: 'pages#northsouthandcentralafrica'


end
