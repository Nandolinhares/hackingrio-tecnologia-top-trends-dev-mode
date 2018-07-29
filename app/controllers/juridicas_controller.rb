class JuridicasController < ApplicationController
  before_action :set_juridica, only: [:show, :edit, :update, :destroy]
  after_action :set_juridica, only: [:set_token]
  after_action :set_token, only: [:create, :update]

  # GET /juridicas
  # GET /juridicas.json
  def index
    @juridicas = Juridica.all.order(:razao)
  end

  # GET /juridicas/1
  # GET /juridicas/1.json
  def show
  end

  # GET /juridicas/new
  def new
    @juridica = Juridica.new
  end

  # GET /juridicas/1/edit
  def edit
  end

  # POST /juridicas
  # POST /juridicas.json
  def create
    @juridica = Juridica.new(juridica_params)

    respond_to do |format|
      if @juridica.save
        format.html { redirect_to @juridica, notice: 'Pessoa Jurídica criada com sucesso!' }
        format.json { render :show, status: :created, location: @juridica }
      else
        format.html { render :new }
        format.json { render json: @juridica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /juridicas/1
  # PATCH/PUT /juridicas/1.json
  def update
    respond_to do |format|
      if @juridica.update(juridica_params)
        format.html { redirect_to @juridica, notice: 'Pessoa Jurídica foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @juridica }
      else
        format.html { render :edit }
        format.json { render json: @juridica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /juridicas/1
  # DELETE /juridicas/1.json
  def destroy
    @juridica.destroy
    respond_to do |format|
      format.html { redirect_to juridicas_url, notice: 'Pessoa Jurídica deletada com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_juridica
      @juridica = Juridica.find(params[:id])
    end

    def set_token
      @juridica = Juridica.tokenizer( Juridica.includes(:socios).last )
      @juridica.update(juridica_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def juridica_params
      params.require(:juridica).permit(:cnpj, :razao, :fantasia, :telefone, :endereco, :token)
    end
end
