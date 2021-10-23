Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # origins ENV.fetch("IDOL_REVIEW_CUSTOMER") { 'localhost:3000' }
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :patch, :put], credentials: false
  end
end