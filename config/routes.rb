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
  post 'approvals/:id/approve' => 'approvals#approve', as: :contract_apvl_approve
  post 'approvals/:id/reject' => 'approvals#reject', as: :contract_apvl_reject
  post 'approvals/:id/cancel' => 'approvals#cancel', as: :contract_apvl_cancel
end
