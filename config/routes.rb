﻿Course::Application.routes.draw do
  root to: "top#index"

  resources :members do
    collection { get "search" }
    resources :course_views
  end

  resources :course_infos do
    collection { get "search" }
    resources :course_views do
      resources :responses
      member { post "response_create" }
    end
    member { put "like", "unlike", "take", "not_take", "not_teacher_rank"}
    member { post "view_create", "take_course_create", "teacher_rank_create", "response_create" }
    collection { get "voted", "taked", "ranked" }
  end

  resources :course_views do
    member { post "response_create" }
    resources :responses
  end
  
  resources :teacher_ranks
  resources :responses
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
    resources :course_infos do
      collection { get "search" }
      member { post "view_create", "take_course_create", "teacher_rank_create", "response_create" }
      member { put "like", "unlike", "take", "not_take", "not_teacher_rank"}
    end
      resources :course_views do
    end
    resources :course_views
    resources :teacher_ranks
    resources :responses
    resources :take_courses
  end

  match "use_policy" => "top#use_policy", as: "use_policy"
  match "privacy" => "top#privacy", as: "privacy"
  match "rabbit" => "top#rabbit", as: "rabbit"

  match "*anything" => "top#not_found"
end
