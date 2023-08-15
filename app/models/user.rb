class User < ApplicationRecord
  include ActiveModel::Validations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { admin: 0, normal_user: 1, supervisor: 2 }

  # ==============Asociations==============
  # recursive asociation to handle supervisors and workers roles
  belongs_to :supervisor, optional: true, class_name: 'User'
  has_many :workers, foreign_key: 'user_id'

  # ============ Validations ==============
  validates_with ContactInfoValidator
  validates_with RutValidator
end
