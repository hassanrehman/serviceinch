class AddUserIdToUserAccess < ActiveRecord::Migration
  def self.up
    add_column :user_accesses, :user_id, :integer
  end

  def self.down
    remove_column :user_accesses, :user_id
  end
end