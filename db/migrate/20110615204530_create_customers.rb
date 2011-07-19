class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :company_name
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :country
      t.string :state
      t.string :city
      t.string :zip
      t.string :website
      t.string :email
      t.string :phone
      t.string :fax
      t.string :mobile_phone

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
