class ParentsController < ApplicationController
  skip_before_action :authorized, only: [:create, :login, :index]
  before_action :authorized, only: [:auto_login]
  before_action :set_parent, only: [:show]

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
    @parent = Parent.new(parent_params)
    if @parent.valid?
      token = encode_token({ parent_id: @parent.id })
      @parent.save
      render json: { parent: @parent, token: token }
    else
      render json: { error: @parent.errors.full_messages }
    end
  end

  def login
    @parent = Parent.find_by(email: parent_params[:email])

    if @parent&.authenticate(parent_params[:password])
      token = encode_token({ parent_id: @parent.id })
      render json: { parent: @parent, token: token }
    else
      render json: { error: 'Invalid Username/Password or User Type. Please try again.' }
    end
  end

  def auto_login
    token = encode_token({ parent_id: @parent.id })
    if token
      render json: { parent: @parent, token: token }
    else 
      render json: {error: 'Please log in'}
    end
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

  def set_parent
    @parent = Parent.find(params[:id])
  end

  def parent_params
    params.require(:parent).permit(:first_name, :last_name, :email, :password, :bio, :city, :state, :language, :smoker, :has_pets, :hourly_rate, :number_of_children)
  end

end