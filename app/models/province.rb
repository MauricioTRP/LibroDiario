class Province < ApplicationRecord
  belongs_to :region
  has_many :comunes, dependent: :destroy
end
