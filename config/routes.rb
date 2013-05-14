Course::Application.routes.draw do
  root to: "top#index"

  resources :members do
    collection { get "search" }

    resources :course_views
  end

  resources :course_infos do
    collection { get "search" }

    resources :course_views
    member { put "like", "unlike", "bad", "no_bad", "take", "not_take", "not_teacher_rank" }
    collection { get "voted", "taked", "ranked" }
  end

  resources :course_views
  resources :teacher_ranks

  resources :take_courses
  resource :session, only: [:create, :destroy]
  resource :account do 
      resources :course_views
      resources :take_courses
  end

  namespace :admin do
    root to: "top#index"
    resources :members do
      collection { get "search" }
    end
    resources :course_infos
    resources :course_views
  end

  match "use_policy" => "top#use_policy", as: "use_policy"
  match "privacy" => "top#privacy", as: "privacy"
  match "rabbit" => "top#rabbit", as: "rabbit"

  match "*anything" => "top#not_found"

end
