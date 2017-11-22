Course::Application.routes.draw do
  root to: "top#index"

  resources :members, only: [ :new, :create, :edit, :update, :destroy ] do
    resources :course_views
  end

  resources :course_infos, only: [ :create, :show, :index, :new ] do
    collection { get "search" }
    collection { get "new_course_search" }
    resources :course_views do
      resources :responses
      member { post "response_create" }
    end
    member { post "like", "unlike", "take", "not_take", "not_teacher_rank"}
    member { post "view_create", "take_course_create", "teacher_rank_create", "response_create" }
    collection { get "voted", "taked", "ranked" }
  end

  resources :course_views do
    member { post "response_create" }
    resources :responses
  end

  resources :circles do
    collection { get "search" }
    get :password_confirm, on: :member
  end

  resources :teacher_ranks
  resources :responses
  resources :take_courses
  resource :session, only: [:create, :destroy, :new] do

  end
  resource :account do
      resources :course_views
      resources :take_courses
      get :schedule, on: :member
      get :comment, on: :member
      get :setting, on: :member
      get :withdrawal, on: :member
      get :timeline, on: :member
  end

  namespace :admin do
    root to: "top#index"
    resources :members do
      collection { get "search" }
    end
    resources :course_infos do
      collection { get "search" }
      member { post "view_create", "take_course_create", "teacher_rank_create", "response_create" }
      member { post "like", "unlike", "take", "not_take", "not_teacher_rank"}
    end
      resources :course_views do
    end
    resources :course_views
    resources :teacher_ranks
    resources :responses
    resources :take_courses
  end

  resource :password, only: [] do
      get :forgot, :send_mail
      post :start_resetting
  end

  match "use_policy" => "top#use_policy", as: "use_policy"
  match "privacy" => "top#privacy", as: "privacy"
  match "rabbit" => "top#rabbit", as: "rabbit"

  match "*anything" => "top#not_found"
end
