class ApplicationController < ActionController::API
  before_action :authenticate_api_key

  private

  def authenticate_api_key
    api_key = request.headers['X-Api-Key']

    return if api_key && ActiveSupport::SecurityUtils.secure_compare(api_key, ENV.fetch('API_KEY', nil))

    render status: :unauthorized, json: { error: 'Unauthorized' }
  end
end
