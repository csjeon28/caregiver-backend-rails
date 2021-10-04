class ParentsController < ApplicationController
  before_action :authorized, only: [:auto_login, :update, :destroy]
  # before_action :authorized, only: [:update, :destroy]
  before_action :set_parent, only: [:show, :update, :destroy]

  # GET /parents
  def index
    @parents = Parent.all
    render json: @parents
  end

  # GET /parents/:id
  def show
    render json: @parent
  end

  # POST /parents
  def create
    @parent = Parent.create(parent_params)

    if @parent.valid?
      token = encode_token({ parent_id: @parent.id })
      render json: { parent: @parent, token: token }
    else
      render json: { error: 'Email already registered' }
    end
  end

  def login
    @parent = Parent.find_by(email: parent_params[:email])

    if @parent&.authenticate(parent_params[:password])
      token = encode_token({ parent_id: @parent.id })
      render json: { parent: @parent, token: token }
    else
      render json: { error: 'Invalid username or password' }
    end
  end

  def auto_login
    token = encode_token({ parent_id: @parent.id })
    render json: { parent: @parent, token: token }
  end

  # PATCH /parents/:id
  def update
    if @parent.update(parent_params)
      render json: @parent
    else
      render json: @parent.errors, status: :unprocessable_entity
    end
  end

  # DELETE /parents/:id
  def destroy
    @parent.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_parent
    @parent = Parent.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def parent_params
    params.require(:parent).permit(:first_name, :last_name, :email, :password, :bio, :city, :state, :country, :language, :smoker, :has_pets, :hourly_rate, :profile_image, :number_of_children)
  end

end