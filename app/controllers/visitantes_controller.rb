class VisitantesController < ApplicationController
  before_action :set_visitante, only: [:show, :edit, :update, :destroy]

  # GET /visitantes
  # GET /visitantes.json
  def index
    @visitante = Visitante.new
  end

  # GET /visitantes/1
  # GET /visitantes/1.json
  def show
  end

  # GET /visitantes/new
  def new
    Rails.logger.debug "DEBUG: entrando al método new"
    @visitante = Visitante.new
    # carga los datos del formulario
    Rails.logger.debug "DEBUG: Nombre del usuario"+@visitante.nombre
    flash[:notice]='Bienvenido!'
    flash[:alert]='Mi cumpleaños está cerca'
    flash[:warnning]='CIUDADO PELIGRO.'
    flash[:success]= 'EXITO!'
  
  end

  # GET /visitantes/1/edit
  def edit
  end

  # POST /visitantes
  # POST /visitantes.json
  def create
    # guarda todos los campos del formulario en una instancia del modelo @visitante
    @visitante = Visitante.new(visitante_params)

    respond_to do |format|
      # el modelo es el que hace las validaciones
      # si las validaciones del modelo pasan y guarda los datos en la tabla
      if @visitante.save
        # redirect_to llama a la vista show (sus datos fueron guardados exitosamente)
        # notice un mensaje que va a cargar en la pagina
        format.html { redirect_to @visitante, notice: 'Visitante was successfully created.' }
        format.json { render :show, status: :created, location: @visitante }
      else
        # si hay error en los campos carga de nuevo el formulario
        format.html { render :new }
        format.json { render json: @visitante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitantes/1
  # PATCH/PUT /visitantes/1.json
  def update
    respond_to do |format|
      if @visitante.update(visitante_params)
        format.html { redirect_to @visitante, notice: 'Visitante was successfully updated.' }
        format.json { render :show, status: :ok, location: @visitante }
      else
        format.html { render :edit }
        format.json { render json: @visitante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitantes/1
  # DELETE /visitantes/1.json
  def destroy
    @visitante.destroy
    respond_to do |format|
      format.html { redirect_to visitantes_url, notice: 'Visitante was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitante
      @visitante = Visitante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visitante_params
      params.fetch(:visitante, {})
    end
end
