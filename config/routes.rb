Rails.application.routes.draw do
    
    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    get 'signout', to: 'sessions#destroy', as: 'signout'
    get 'note_delete', to: 'notes#destroy'

    resources :sessions, only: [:create, :destroy]
    resources :home, only: [:show]
    resources :notes
    
    root to: "home#show"
end


# Rails.application.routes.draw do
#   get 'sessions/create'

#   get 'sessions/destroy'

#   get 'home/show'

# end
