Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  resources :acts
  resources :approvals
  resources :contracts do
    resources :documents
  end
  resources :performances
  # resources :users
  resources :venues
  post 'approvals/:id/approve' => 'approvals#approve', as: :approve
  post 'approvals/:id/cancel' => 'approvals#cancel', as: :cancel_approval
end
