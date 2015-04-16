class ApplicationController < ActionController::Base
  check_authorization
  rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_url, :alert => exception.message
  end
  protect_from_forgery with: :exception
  include SessionsHelper
<<<<<<< HEAD

  before_filter :create_visit

  private

  def create_visit
    ua = AgentOrange::UserAgent.new(request.user_agent)
    browser = ua.device.engine.browser
    os = ua.device.operating_system
    device_type = ua.device.type.capitalize

    Visit.create  ip: request.remote_ip,
                  browser: browser.name,
                  browser_version: browser.version.to_s,
                  os_name: os.name,
                  os_version: os.version.to_s,
                  devise: device_type

  end

=======
  include FriendshipHelper
>>>>>>> feature/friendship_relations
end
