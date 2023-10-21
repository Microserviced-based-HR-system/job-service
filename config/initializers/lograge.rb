Rails.application.configure do
  config.lograge.formatter = Lograge::Formatters::Json.new
  config.lograge.enabled = true
  config.lograge.base_controller_class = 'ActionController::API'
  config.lograge.custom_options = lambda do |event|
    {
      request_time: Time.now,
      application: Rails.application.class,
      process_id: Process.pid,
      host: event.payload[:host],
      remote_ip: event.payload[:remote_ip],
      ip: event.payload[:ip],
      x_forwarded_for: event.payload[:x_forwarded_for],
      rails_env: Rails.env,
      request_id: event.payload[:headers]['action_dispatch.request_id'],
    }.compact
  end
end
