class StaticPagesController < ApplicationController
  def home
    @products = Product.newest.paginate page: params[:page],
      per_page: Settings.index_per_page
    @order_item = current_order.order_items.new
  end

  def help; end

  def about; end

  def contact; end
end
