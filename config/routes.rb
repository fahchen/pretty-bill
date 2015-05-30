Rails.application.routes.draw do
  resources :merchants

  mount ChinaCity::Engine => '/china_city'
end
