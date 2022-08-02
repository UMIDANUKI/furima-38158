class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefectures
  belongs_to :time_required

  has_one_attached :image
  belongs_to :user
  has_one :order

  validates :name, presence: true, length: { minimum: 1, maximum: 40 }
  validates :explanation, presence: true, length: { minimum: 1, maximum: 1000 }
  validates :image, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ },
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :prefectures_id
    validates :time_required_id
  end
end
