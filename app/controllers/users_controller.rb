class UsersController < ApplicationController
  before_action :is_admin?



  private

  def is_admin?
    if not current_user.role == admin
      
    end
  end
end