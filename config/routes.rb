Rails.application.routes.draw do
  resources :merchants do
    resources :products
    resources :orders do
      collection do
        get :add_order_item
      end

      member do
        get :report
      end
    end
  end

  mount ChinaCity::Engine => '/china_city'
end
