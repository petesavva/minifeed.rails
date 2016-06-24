if %w(production staging).include?(Rails.env)
  Rails.application.config.middleware.use(ExceptionNotification::Rack,
    :email => {
      :email_prefix         => "[Mom #{Rails.env}] ",
      :sender_address       => %{"Mom Notifier" <#{ApplicationMailer::DEFAULT_FROM}>},
      :exception_recipients => %w{support@agilidee.com},
    }
  )
end