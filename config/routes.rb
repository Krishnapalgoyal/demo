Rails.application.routes.draw do


  # root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 root "home#index"


  delete '/logout' => 'sessions#destroy'
   get '/logout' => 'sessions#destroy'
 
   resources :sessions
   resources :employs
   resources :departments

   

end
