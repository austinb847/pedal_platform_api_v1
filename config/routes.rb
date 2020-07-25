Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json } do
    namespace :v1 do
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      get '/logged_in', to: 'sessions#is_logged_in?'
      resources :users
      resources :pedals
      get '/random' => 'pedals#random'
      get '/search' => 'pedals#search'
      get '/value' => 'pedals#value'
      get '/standard' => 'pedals#standard'
      get '/premium' => 'pedals#premium'
      get '/featured' => 'pedals#featured'
      get '/recent' => 'pedals#recent'
      get '/delay_pedals' => 'pedals#delay'
      get '/fuzz_pedals' => 'pedals#fuzz'
      get '/distortion_pedals' => 'pedals#distortion'
      get '/overdrive_pedals' => 'pedals#overdrive'
    end
  end
end
