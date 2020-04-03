if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_tugether', domain: 'some_future_domain'
else
  Rails.application.config.session_store :cookie_store, key: '_tugether'
end
