class AccountType < ApplicationRecord
  has_many :accounts, foreign_key: 'type_id'
end
