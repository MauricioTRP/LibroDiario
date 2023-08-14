class Account < ApplicationRecord
  belongs_to :type, class_name: 'AccountType'
end
