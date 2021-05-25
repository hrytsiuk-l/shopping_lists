Rails.application.routes.draw do
  # resources :lists do
  #   resources :items
  # end 

  get    '/lists',          to: 'lists#index', as: 'lists'
  post   '/lists',          to: 'lists#create'
  get    '/lists/new',      to: 'lists#new',   as: 'new_list'
  get    '/lists/:id',      to: 'lists#show',  as: 'list'
  get    '/lists/:id/edit', to: 'lists#edit',  as: 'edit_list'
  patch    '/lists/:id',    to: 'lists#update'
  delete '/lists/:id',      to: 'lists#destroy'

  get    '/lists/:list_id/items',            to: 'items#index', as: 'list_items'
  post   '/lists/:list_id/items',            to: 'items#create'
  get    '/lists/:list_id/items/new',        to: 'items#new',   as: 'new_list_items'
  get    '/lists/:list_id/items/:uid/edit',  to: 'items#edit',  as: 'edit_list_items'
  get    '/lists/:list_id/items/:uid',       to: 'items#show',  as: 'list_item'
  put    '/lists/:list_id/items/:uid',       to: 'items#update'
  delete '/lists/:list_id/items/:uid',       to: 'items#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
