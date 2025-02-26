module Api
  module V1
    class UsersController < ApplicationController
      respond_to :json

      def index
        @users = User.all

        render status: :ok
      end

      def show
        @user = User.find(params[:id])

        render status: :ok
      end
    end
  end
end
