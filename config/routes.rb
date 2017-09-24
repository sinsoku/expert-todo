Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    resources :tasks

    root to: "tasks#index", as: :user_root
  end

  root to: 'pages#top'
end
