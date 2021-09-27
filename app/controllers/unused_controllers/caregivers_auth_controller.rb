# class CaregiversAuthController < ApplicationController
#     def create
#         caregiver = Caregiver.find_by(email: session_params[:email])
#         if caregiver && caregiver.authenticate(session_params[:password])
#             token = JWT.encode({ caregiver_id: caregiver.id }, ENV['SECRET_KEY'])
#             render json: { token: token }, status: :created
#         else
#             render json: { errors: "Email/Password is incorrect." }, status: :unauthorized
#         end
#     end

#     # def auto_login
#     #     render json: {caregiver: CaregiverSerializer.new(current_caregiver)}
#     # end
      
#     private
    
#     def session_params
#         params.require(:caregiver).permit(:email, :password)
#     end
# end