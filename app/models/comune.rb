class Comune < ApplicationRecord
  belongs_to :province
  belongs_to :region
end
