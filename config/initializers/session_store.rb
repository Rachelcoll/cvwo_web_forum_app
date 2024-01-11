if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: "_web_forum", domain: "https://pacific-headland-38946-b42f15bc43e4.herokuapp.com"
else
    Rails.application.config.session_store :cookie_store, key: "_web_forum"
end