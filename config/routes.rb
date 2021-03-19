Rails.application.routes.draw do
  get 'adicionar', to: 'books#new'
  get 'mostrar', to: 'books#index'
  root 'application#homepage'
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
