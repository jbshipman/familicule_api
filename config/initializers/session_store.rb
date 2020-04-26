if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_familicule_app", domain: "familicule-api.herokuapp.com"
else
  Rails.application.config.session_store :cookie_store, key: "_familicule_app"
end
