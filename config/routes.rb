Rails.application.routes.draw do
  root 'general#welcome'
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  resources :acts
  resources :contracts do
    resources :documents, only: [:new, :create, :edit, :update, :destroy, :show], as: :documents
  end
  get '/performances/list' => 'performances#performances_listing'
  resources :performances
  get 'performances/:id/details' => 'performances#performance_detail'
  scope 'admin' do
    resources :users, only: [:index, :edit, :update, :destroy]
  end

  resources :venues

  post 'approvals/approve' => 'approvals#approve', as: :contract_apvl_approve
  post 'approvals/reject' => 'approvals#reject', as: :contract_apvl_reject
  post 'approvals/cancel' => 'approvals#cancel', as: :contract_apvl_cancel
  get  'approvals/pending' => 'approvals#pending_approval'


end
