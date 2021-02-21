Rails.application.routes.draw do

  get 'entry/tracking'
  get 'entry/random'
  post 'entry/read'

  root to: 'page#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
