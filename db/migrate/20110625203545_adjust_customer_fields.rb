class AdjustCustomerFields < ActiveRecord::Migration
  def self.up
    add_column :customers, :address_1, :string
    add_column :customers, :address_2, :string
    Customer.update_all("address_1=address")
    remove_column :customers, :address

    add_column :customers, :work_phone, :string
    add_column :customers, :state_id, :integer
    remove_column :customers, :state
  end

  def self.down
    add_column :customers, :address, :string
    Customer.update_all("address = address_1")
    remove_column :customers, :address_1
    remove_column :customers, :address_2

    remove_column :customers, :work_phone
    remove_column :customers, :state_id
    add_column :customers, :state
  end
end
