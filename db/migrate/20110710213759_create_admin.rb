class CreateAdmin < ActiveRecord::Migration
  def self.up
    u = User.new({:login => "admin", :name => "Administrator", :email => "administrator@serviceinch.com",
          :password => "admin123", :password_confirmation => "admin123"})
    u.user_access = UserAccess.create(:comments => "Main Administrator",
          :can_create_ticket => true, :can_edit_customer => true)
    u.save
  end

  def self.down
    User.delete_all(["login=?", "admin"])
  end
end
