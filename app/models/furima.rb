class Furima < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :name, :price, :description, :category, :condition, :postage, :prefecture, :shipping_date, presence: true

  validates :category_id, :prefecture_id, :condition_id, :shipping_date_id, :postage_id, numericality: { other_than: 1 }
end
