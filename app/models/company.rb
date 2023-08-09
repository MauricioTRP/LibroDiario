class Company < ApplicationRecord
  include ActiveModel::Validations

  # ============ Validations ==============
  validates_with RutValidator
  validates_with ContactInfoValidator
end
