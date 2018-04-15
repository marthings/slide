class Presentation < ApplicationRecord
  validates :title, presence: true
  validates :cover, presence: true
  belongs_to :user
  has_many :parts, dependent: :destroy
  has_one_attached :cover
end
