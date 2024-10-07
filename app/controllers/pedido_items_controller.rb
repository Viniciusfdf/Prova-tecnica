class PedidoItemsController < ApplicationController
  before_action :set_pedido_item, only: %i[ show edit update destroy ]

  # GET /pedido_items or /pedido_items.json
  def index
    @pedido_items = PedidoItem.all
  end

  # GET /pedido_items/1 or /pedido_items/1.json
  def show
  end

  # GET /pedido_items/new
  def new
    @pedido_item = PedidoItem.new
  end

  # GET /pedido_items/1/edit
  def edit
  end

  # POST /pedido_items or /pedido_items.json
  def create
    @pedido_item = PedidoItem.new(pedido_item_params)

    respond_to do |format|
      if @pedido_item.save
        format.html { redirect_to @pedido_item, notice: "Pedido item was successfully created." }
        format.json { render :show, status: :created, location: @pedido_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pedido_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedido_items/1 or /pedido_items/1.json
  def update
    respond_to do |format|
      if @pedido_item.update(pedido_item_params)
        format.html { redirect_to @pedido_item, notice: "Pedido item was successfully updated." }
        format.json { render :show, status: :ok, location: @pedido_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pedido_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedido_items/1 or /pedido_items/1.json
  def destroy
    @pedido_item.destroy!

    respond_to do |format|
      format.html { redirect_to pedido_items_path, status: :see_other, notice: "Pedido item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido_item
      @pedido_item = PedidoItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pedido_item_params
      params.require(:pedido_item).permit(:produto_id, :pedido_id)
    end
end
