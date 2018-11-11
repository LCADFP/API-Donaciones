class DonacionsController < ApplicationController
  before_action :set_donacion, only: [:show, :edit, :update, :destroy]

  # GET /donacions
  def index
    @donacions = Donacion.all
    render json: @donacions
  end

  # GET /donacions/1
  def show
  end

  # GET /donacions/new
  def new
    @donacion = Donacion.new
  end

  # GET /donacions/1/edit
  def edit
  end

  # POST /donacions
  def create
    @donacion = Donacion.new(donacion_params)

    if @donacion.save
      redirect_to @donacion, notice: 'Donacion was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /donacions/1
  def update
    if @donacion.update(donacion_params)
      redirect_to @donacion, notice: 'Donacion was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /donacions/1
  def destroy
    @donacion.destroy
    redirect_to donacions_url, notice: 'Donacion was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donacion
      @donacion = Donacion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def donacion_params
      params.require(:donacion).permit(:nombre, :estado, :categoria, :cantidad, :img, :descripcion, :users_id)
    end
end
