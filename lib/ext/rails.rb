def Rails.app_id
  Rails.application.class.parent_name.downcase
end

def Rails.app_env_id
  "#{app_id}_#{env}"
end
