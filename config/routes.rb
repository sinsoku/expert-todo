# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    resources :tasks do
      resource :task_completion, module: :tasks, path: :completion, only: :create
    end

    root to: "tasks#index", as: :user_root
  end

  root to: 'pages#top'

  direct(:community_connpass) { "https://step-to-rails-expert-rb.connpass.com/" }
  direct(:source) { "https://github.com/sinsoku/expert-todo" }
end
