Rails.application.routes.draw do
  resources :merchants do
    resources :products
    resources :orders
  end

  mount ChinaCity::Engine => '/china_city'
end
