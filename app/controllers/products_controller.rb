class ProductsController < ApplicationController
  before_action :load_product, only: :show

  def index
    @products = Product.newest.paginate page: params[:page],
      per_page: Settings.index_per_page
    @order_item = current_order.order_items.new
  end

  def show; end
end
