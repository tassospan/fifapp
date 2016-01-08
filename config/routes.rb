Rails.application.routes.draw do
  resources :projects
  get 'admin', to: 'projects#admin'
  root 'projects#index'
end
