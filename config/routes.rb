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

 get "/deleted_employee/" => "employees#deleted_employee", as: :deleted_employee

 get "/restore_employee/:id" => "employees#restore_employee", as: :restore_employee
 resources :sessions
 resources :employees do 
 resource :addresses
 
 end

 resources :departments do
  get :all_employee, on: :member
 end

 get "/really_destroy/:id" => "employees#really_destroy",as: :really_destroy
 post "/bulk_destroy/" =>"employees#bulk_destroy"
end