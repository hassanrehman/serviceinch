class CreateUserAccesses < ActiveRecord::Migration
  def self.up
    create_table :user_accesses do |t|
      t.string :comments
      t.boolean :can_create_ticket
      t.boolean :can_edit_customer

      t.timestamps
    end
  end

  def self.down
    drop_table :user_accesses
  end
end
