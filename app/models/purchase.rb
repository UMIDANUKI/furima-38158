class Purchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefectures_id, :municipalities, :address, :buildings, :phone_number, :order_id,
                :token

  extend ActiveHash::Associations::ActiveRecordExtensions
 
  with_options presence: true do
    validates :post_code  ,format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefectures_id , numericality: { other_than: 1 }
    validates :municipalities
    validates :address
    validates :phone_number , format:{with: /\A[0-9]+\z/i}, length: { minimum: 10, maximum: 11 }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    OrderDetail.create(post_code: post_code, prefectures_id: prefectures_id, municipalities: municipalities, address: address,
                       buildings: buildings, phone_number: phone_number, order_id: order.id)
  end
end
