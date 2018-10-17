class UsersController < ApplicationController

  before_action :authenticate_user, except: [:create, :confirm_email]
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token, only:[:create]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    render json: @users
  end

  # GET /users/new
  #def new
    #@user = User.new
  #end

  # GET /users/1/edit
  #def edit
  #end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save 

      UserMailer.registration_confirmation(@user).deliver   

      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def confirm_email #metodo que se ejecuta cuando se hace clic en el link enviado al email
    @user = User.find_by_confirm_token(params[:token])
    
    if @user
       @user.validate_email
       @user.save(validate: false)
       render template: 'home/confirm'
    else
      render template: 'home/error', status: :unauthorized       
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:nombres, :apellidos, :fecha_nac, :direccion, :telefono, :email, :role_id, :password,
        :password_confirmation)
    end
end
