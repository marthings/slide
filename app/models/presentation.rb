class Presentation < ApplicationRecord
  validates :title, presence: true
  belongs_to :user, default: -> { Current.user }
  has_many :parts, dependent: :destroy
  has_one_attached :cover
end


