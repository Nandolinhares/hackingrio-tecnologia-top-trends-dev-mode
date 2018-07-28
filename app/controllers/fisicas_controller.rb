class FisicasController < ApplicationController
  before_action :set_fisica, only: [:show, :edit, :update, :destroy]

  # GET /fisicas
  # GET /fisicas.json
  def index
    @fisicas = Fisica.all.order(:nome)
  end

  # GET /fisicas/1
  # GET /fisicas/1.json
  def show
  end

  # GET /fisicas/new
  def new
    @fisica = Fisica.new
  end

  # GET /fisicas/1/edit
  def edit
  end

  # POST /fisicas
  # POST /fisicas.json
  def create
    @fisica = Fisica.new(fisica_params)
    if @fisica.save
      flash[:notice] = "Pessoa Jurídica cadastrada com sucesso"
      redirect_to fisicas_path
    else
      renderiza (:new)  
    end
  end

  # PATCH/PUT /fisicas/1
  # PATCH/PUT /fisicas/1.json
  def update
    if @fisica.update fisica_params
      flash[:notice] = "As informações da Pessoa Jurídica foram atualizadas com sucesso"
      redirect_to fisicas_path
    else
      renderiza (:edit)  
    end
  end

  # DELETE /fisicas/1
  # DELETE /fisicas/1.json
  def destroy
    @fisica.destroy
    respond_to do |format|
      format.html { redirect_to fisicas_url, notice: 'A Pessoa Física foi deletada do Banco de Dados.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fisica
      @fisica = Fisica.find(params[:id])
    end

    def renderiza(view)
      render view
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fisica_params
      params.require(:fisica).permit(:nome, :cpf, :telefone, :endereco, :token)
    end
end
