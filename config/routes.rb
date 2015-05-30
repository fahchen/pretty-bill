Rails.application.routes.draw do
  resources :merchants do
    resources :products
  end

  mount ChinaCity::Engine => '/china_city'
end
