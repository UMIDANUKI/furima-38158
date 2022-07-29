class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefectures
  belongs_to :time_required

  has_one_attached :image

  validates :name, presence: true
  validates :explanation, presence: true
  validates :image, presence: true
  validates :price, presence: true, format: {with: /\A[0-9]+\z/},  numericality: { in: 300..9999999 }
  
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :prefectures_id
    validates :time_required_id
  end
end
