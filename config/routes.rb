Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    resources :tasks

    root to: "tasks#index", as: :user_root
  end

  root to: 'pages#top'

  direct(:community_connpass) { "https://step-to-rails-expert-rb.connpass.com/" }
  direct(:source) { "https://github.com/sinsoku/expert-todo" }
end
