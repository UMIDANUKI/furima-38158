class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefectures
  belongs_to :time_required
  
  has_one_attached :image
end
