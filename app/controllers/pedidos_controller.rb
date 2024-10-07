class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :create, :update, :destroy]
  before_action :load_clientes_and_produtos, only: [:new, :edit, :create, :update]

  # GET /pedidos or /pedidos.json
  def index
    @pedidos = Pedido.includes(:cliente, :produtos).all
  end

  # GET /pedidos/1 or /pedidos/1.json
  def show
    @pedido = Pedido.find(params[:id])
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
    @clientes = Cliente.where(ativo: true) # Exibir apenas clientes ativos
    @produtos = Produto.where(ativo: true)       # Exibir apenas produtoutos ativos
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos or /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)

    if @pedido.save
      # Salvar os itens do pedido
      if params[:pedido][:produto_ids]
        params[:pedido][:produto_ids].each do |produto_id|
        end
      end
      redirect_to @pedido, notice: 'Pedido criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /pedidos/1 or /pedidos/1.json
  def update
    @pedido = Pedido.find(params[:id])

    if @pedido.update(pedido_params)
      # Atualiza os produtos associados
      @pedido.produtos.clear # Limpa os produtos anteriores

      if params[:pedido][:produtos_ids].present?
        params[:pedido][:produtos_ids].each do |produto_id|
          @pedido.produtos << Produto.find(produto_id) unless produto_id.blank?
        end
      end
      redirect_to @pedido, notice: 'Pedido atualizado com sucesso.'
    else
      render :edit
    end
  end


  # DELETE /pedidos/1 or /pedidos/1.json
  def destroy
    @pedido.destroy!

    respond_to do |format|
      format.html { redirect_to pedidos_path, status: :see_other, notice: "Pedido was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_pedido
    @pedido = Pedido.find(params[:id])
  end

  def load_clientes_and_produtos
    @clientes = Cliente.where(ativo: true) # Exibe somente os clientes ativos
    @produtos = Produto.where(ativo: true) # Exibe somente os produtos ativos
  end

    # Only allow a list of trusted parameters through.
  def pedido_params
    params.require(:pedido).permit(:cliente_id, :total, produtos_ids: [])
  end

end
