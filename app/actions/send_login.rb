class SendLogin < Action
  def execute(event)
    login_url = "#{Rails.application.secrets.cai[:auth_base_url]}/auth?state=#{event.to_json}"

    [link_button(message: 'Please log you first.', link_name: 'Login', link_href: login_url)]
  end
end
