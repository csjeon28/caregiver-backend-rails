class ParentsSessionsController < ApplicationController
    def create
        parent = Parent.find_by(email: session_params[:email])
        if parent.authenticate(session_params[:password])
            token = JWT.encode({ parent_id: parent.id }, ENV['SECRET_KEY'])
            # render json: { parent: ParentSerializer.new(parent) token: token }
            render json: { token: token }
        else
            render json: { errors: "Email/Password is incorrect." }, status: :unauthorized
        end
    end

    # def auto_login
    #     render json: {parent: ParentSerializer.new(current_parent)}
    # end
      
    private
    
    def session_params
        params.require(:parent).permit(:email, :password)
    end
end