module Api
  module V1
    class SessionsController < Devise::SessionsController
      respond_to :json

      def create
        self.resource = warden.authenticate!(auth_options)

        resource.update_jwt_expiration
        sign_in(resource_name, resource, store: false)
        yield resource if block_given?

        respond_with resource, location: after_sign_in_path_for(resource)
      end

      private

      def respond_to_on_destroy
        head :no_content
      end
    end
  end
end
