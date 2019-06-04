Rails.application.routes.draw do
  root 'tweets#index'
  resources :tweets do
    resource :answer, only:[:show,:create,:new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
