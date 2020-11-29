Rails.application.routes.draw do
 get 'booklists/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root to: 'homes#top'
 post 'booklists' => 'booklists#create'
get 'booklists' =>'booklists#index'
get 'booklists/:id' => 'booklists#show', as: 'booklist'
get 'booklists/:id/edit' => 'booklists#edit', as: 'edit_booklist'
patch 'booklists/:id' => 'booklists#update', as: 'update_booklist'
delete 'booklists/:id' => 'booklists#destroy', as: 'destroy_booklist'
end
