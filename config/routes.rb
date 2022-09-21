Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 root "admins#index"


  delete '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'
 resources :admins
 resource :sessions
delete '/destroy' => 'employees#destroy'
  get '/destroy' => 'employees#destroy'
 resources :employees

end
