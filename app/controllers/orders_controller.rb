class OrdersController < ApplicationController
  before_action :set_merchant
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = @merchant.orders
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = @merchant.orders.new
    @order.build_customer
    @order.order_items.build
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = @merchant.orders.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to [@merchant, @order], notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: [@merchant, @order] }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update_attributes(order_params)
        format.html { redirect_to [@merchant, @order], notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: [@merchant, @order] }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to merchant_url(@merchant), notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_order_item
    @order = Order.new
    @order_item = @order.order_items.build
    render 'add_order', layout: false
  end

  private
  def set_merchant
    @merchant = Merchant.find(params[:merchant_id])
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = @merchant.orders.includes(:customer, order_items: [:product]).find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:transacted_at, customer_attributes: [:id, :name, :phone, :gender], order_items_attributes: [:id, :product_id, :quantity, :_destroy])
  end
end
