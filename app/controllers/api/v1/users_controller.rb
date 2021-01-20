# class Api::V1::UsersController < ApplicationController
#
#   def create
#     user = User.new(user_params)
#     if user.save
#       UserSerializer(new_user)
#     else
#       #400 error with user friendly error message
#     end
#   end
#
#   private
#
#   def user_params
#     params.permit(:email, :password, :password_confirmation)
#   end
# end
