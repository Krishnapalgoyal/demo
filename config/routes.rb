Rails.application.routes.draw do
 # root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 root "home#index"
 delete '/logout' => 'sessions#destroy'
 get '/logout' => 'sessions#destroy'
 get '/search' => 'employees#index'

 get "/edit/:id/" => "employees#edit", as: :edit_employee
 patch "/update/:id/" => "employees#update", as: :update_employee

 # post '/request'=>"employees#leave_request"
 # get '/leave'  =>"employees#leave_index"
 resources :leaves
 get "/leave_status/:id/" => "leaves#leave_status", as: :leave_status
 get "/rejected/:id/" => "leaves#rejected", as: :rejected
 resources :sessions
 resources :employees do 
 resource :addresses
 end

 resources :departments do
  get :all_employee, on: :member
 end

end
