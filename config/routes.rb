Rails.application.routes.draw do
 # root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 root "home#index"
 delete '/logout' => 'sessions#destroy'
 get '/logout' => 'sessions#destroy'
 get '/search' => 'employees#index'

 get "/edit/:id/" => "employees#edit", as: :edit_employee
 resources :sessions
 resources :employees

 resources :departments do
  get :all_employee, on: :member
 end

   

end
