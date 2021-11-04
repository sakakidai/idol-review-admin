Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins Settings.customer_app.base_url, 'localhost:3000', ENV.fetch("MY_IP") { 'localhost' }
    resource '*', headers: :any, methods: [:get, :post, :patch, :put], credentials: true
  end
end