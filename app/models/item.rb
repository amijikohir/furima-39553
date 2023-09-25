class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :lead_time

validates :name              , presence: true, length: {maximum: 40}
validates :information       , presence: true, length: {maximum: 1000}
validates :category_id       , presence: true
validates :condition_id      , presence: true
validates :shipping_charge_id, presence: true
validates :prefecture_id     , presence: true
validates :lead_time_id      , presence: true
validates :price             , presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }, format: { with: /\A[0-9]+\z/ }
validates :image             , presence: true

validates :category_id       , numericality: { other_than: 1 , message: "can't be blank"}
validates :condition_id      , numericality: { other_than: 1 , message: "can't be blank"}
validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
validates :prefecture_id     , numericality: { other_than: 1 , message: "can't be blank"}
validates :lead_time_id      , numericality: { other_than: 1 , message: "can't be blank"}

end
