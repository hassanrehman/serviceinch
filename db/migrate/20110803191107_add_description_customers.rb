class AddDescriptionCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :description, :text
  end

  def self.down
    remove_column :customers, :description
  end
end
