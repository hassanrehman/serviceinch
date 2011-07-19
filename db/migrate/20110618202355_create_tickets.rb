class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.integer :added_by_id
      t.string :subject
      t.text :description
      t.integer :ticket_status_id
      t.integer :ticket_priority_id
      t.integer :assignee_id
      t.integer :ticket_category_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer :customer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
