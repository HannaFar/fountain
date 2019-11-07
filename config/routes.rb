Rails.application.routes.draw do
  root 'main_page#index'

  resources :jobs

  get '/job/:id/apply', to: 'jobs#apply', as: 'apply'
  match '/job/:id/apply_to_job', to: 'jobs#apply_to_job', via: 'post'

  devise_for :employers, controllers: {sessions: "employer/sessions"}
  devise_for :candidates, controllers: {sessions: "candidate/sessions"}
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
