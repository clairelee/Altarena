Rails.application.routes.draw do
    
  resources :profiles
    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    get 'signout', to: 'sessions#destroy', as: 'signout'
    get 'note_delete', to: 'notes#destroy'
    get 'notes_new_musician', to: 'notes#new_musician'
    get 'notes_new_actor', to: 'notes#new_actor'
    post 'notes_create_musician', to: 'notes#create_musician'
    post 'notes_create_actor', to: 'notes#create_actor'
    get 'notes_home', to: 'notes#home'
    post 'notes_search', to: 'notes#search'

    resources :sessions, only: [:create, :destroy]
    resources :home, only: [:show]
    resources :notes
    resources :productions
    resources :profiles, only: [:show]

    root to: "home#show"
end

