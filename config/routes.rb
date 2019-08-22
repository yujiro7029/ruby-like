Rails.application.routes.draw do
  root 'tweets#index'
  devise_for :users
  resource :users do
    collection do
      get "answer-question"
      get "likes_list"
      get "answer"
    end
  end
  resources :tweets do
    collection do
      get "1/description", to:"tweets#description", as: :description
      get "2/select", to:"tweets#select", as: :select
      get "select_problem"
      get "description_problem"
      get "new_tweet"
      get "search"
    end
    resources :comments,only:[:index,:new,:create,:destory] 
    resources :answer_results,only:[:create,:destory,:index] 
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
  #いいね機能
  post "likes/:tweet_id/create", to:"likes#create"
  delete "likes/:tweet_id/create", to:"likes#destroy"
 
  #flag機能
  get "flags/:tweet_id/new", to: "flags#new"
  post "flags/:tweet_id/create", to: "flags#create"
end
