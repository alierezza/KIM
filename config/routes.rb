Rails.application.routes.draw do
  # devise_for :users, :controllers => { :passwords => "passwords" }
   devise_for :users, :controllers => {:sessions => "sessions"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'homepages#index'

  resources :homepages, :dashboards, :kimms, :registers, :members, :admins, :crews, :feedbacks, :lkps
  resources :users, path: "admins"
  resources :users, path: "crews"

  get "prasyarat/" => "homepages#prasyarat", :as => :prasyarat
  get "edit_info/:id" => "dashboards#edit_info", :as => :edit_info
  get "kim_approval/" => "kimms#kim_approval", :as => :kim_approval
  get "download/:id/kim/:id2" => "kimms#download", :as => :download, constraints: { id: /[^\/]+/, id2: /[^\/]+/ }
  get "pdf_kim/:id" => "kimms#pdf_kim", :as => :pdf_kim

end
