Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'homepages#index'

  resources :homepages, :dashboards, :kimms, :registers, :members
  

  get "prasyarat/" => "homepages#prasyarat", :as => :prasyarat

end
