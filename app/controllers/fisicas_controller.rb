class FisicasController < ApplicationController
  before_action :set_fisica, only: [:show, :edit, :update, :destroy]
  after_action :set_token_create, only: [:create]
  after_action :set_token_update, only: [:update]

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

    respond_to do |format|
      if @fisica.save
        format.html { redirect_to @fisica, notice: 'Pessoa Física criada com sucesso.' }
        format.json { render :show, status: :created, location: @fisica }
      else
        format.html { render :new }
        format.json { render json: @fisica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fisicas/1
  # PATCH/PUT /fisicas/1.json
  def update
   respond_to do |format|
      if @fisica.update(fisica_params)
        format.html { redirect_to @fisica, notice: 'Pessoa Física foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @fisica }
      else
        format.html { render :edit }
        format.json { render json: @fisica.errors, status: :unprocessable_entity }
      end
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

    def set_token_update
      @fisica = Fisica.tokenizer( Fisica.find(params[:id])  )
      @fisica.update(fisica_params)
    end

    def set_token_create
      @fisica = Fisica.tokenizer( Fisica.last  )
      @fisica.update(fisica_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fisica_params
      params.require(:fisica).permit(:nome, :cpf, :telefone, :endereco, :token)
    end
end
