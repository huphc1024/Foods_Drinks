class Order < ApplicationRecord
  enum status: %i(pending accepted cancelled)
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items


  before_create :set_order_status

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.price) : 0 }.sum
  end

  private
  
  def set_order_status
    self.order_status_id = 1
  end

  private

  def picture_size
    return unless picture.size > Settings.max_upload_size.megabytes
    errors.add :image, t("less_than_5mb")
  end
end
