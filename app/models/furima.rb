class Furima < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :image, :name, :price, :description, presence: true

  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}	

with_options presence: true, numericality: { other_than: 1 } do
  validates :category_id 
  validates :prefecture_id
  validates :condition_id
  validates :shipping_date_id
  validates :postage_id
end
end
