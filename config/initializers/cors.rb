Rails.application.config.middleware.insert_before 0, Rack::Cors do
    
    allow do
        origins "https://main--comforting-starburst-cdbfae.netlify.app/" #replace this with final react website
        resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    end

    allow do
        origins "http://localhost:3000"
        resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    end
end