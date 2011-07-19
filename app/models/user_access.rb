class UserAccess < ActiveRecord::Base
  belongs_to :user

  def is_admin
    user.login == 'admin'
  end

end
