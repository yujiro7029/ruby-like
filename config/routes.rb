Rails.application.routes.draw do
  root 'tweets#index'
  resources :tweets do
    collection do
      get "1/description", to:"tweets#description", as: :description
      get "2/select", to:"tweets#select", as: :select
    end
    resources :comments,only:[:index,:new,:create,:destory] 
    resources :answers, only:[:index,:update,:destory,:show,:create,:new]
  end 
end
