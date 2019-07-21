Rails.application.routes.draw do
  root 'tweets#index'
  resources :tweets do
    collection do
      get 'select'
    end
    resources :answers, only:[:index,:update,:destory,:show,:create,:new]
  end

 
end
