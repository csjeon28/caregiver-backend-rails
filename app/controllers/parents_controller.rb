class ParentsController < ApplicationController
    # skip_before_action :authorize_parent, only: [:create]
    before_action :authorize_parent, only: [:update]
    before_action :find_parent, only: [:update]

  def create
    parent = Parent.create(parent_params)
    if parent.persisted?
      token = JWT.encode({ parent_id: parent.id }, ENV['SECRET_KEY'])
    #   render json: {parent: ParentSerializer.new(parent), token: token }, status: :created
      render json: {token: token }, status: :created
    else
      render json: {errors: parent.errors.full_messages}, status: :not_acceptable
    end
  end

  def update
    if parent.update(parent_params)
      render json: parent, status: :accepted
    else
      render json: { errors: "Parent profile update failed." }, status: :bad_request
    end
  end

  private

  def parent_params
    params.require(:parent).permit(:first_name, :last_name, :email, :password, 
    :bio, :smoker, :city, :state, :country, :language, :hourly_rate, 
    :has_pets, :profile_image, :number_of_children)
  end

  def find_parent
    parent = Parent.find_by(id: params[:id])
    if !parent
      render json:{ errors: "Could not find parent" }, :status => :bad_request
    else
        return parent
    end
  end
end
