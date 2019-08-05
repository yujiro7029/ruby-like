Rails.application.routes.draw do
  root 'tweets#index'
  devise_for :users
  resource :users
  resources :tweets do
    collection do
      get "1/description", to:"tweets#description", as: :description
      get "2/select", to:"tweets#select", as: :select
    end
    resources :comments,only:[:index,:new,:create,:destory] 
    resources :answer_results,only:[:create] 
    resources :answers do
      collection do
        get "judge"
        get "select_answer"
        get "description_answer"
        post  "select_check"
        post  "description_check"
      end
    end
  end 
end
