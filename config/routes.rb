Rails.application.routes.draw do
  root 'tweets#index'
  resources :tweets do
    resources :answers, only:[:index,:update,:destory,:show,:create,:new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
