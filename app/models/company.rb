class Company < ApplicationRecord
  include ActiveModel::Validations

  # ============ Validations ==============
  validates_with RutValidator
end
