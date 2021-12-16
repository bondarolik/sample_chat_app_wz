Rails.application.routes.draw do
  resources :categories
  resources :articles
  root to: 'posts#index'

  resources :posts, only: %i[index create] do
    get 'like'
    get 'repost'
  end
end
