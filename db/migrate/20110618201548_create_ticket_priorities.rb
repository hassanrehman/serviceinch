class CreateTicketPriorities < ActiveRecord::Migration
  def self.up
    create_table :ticket_priorities do |t|
      t.string :name
      t.string :comments

      t.timestamps
    end
    priorities = "Low;Normal;High;Urgent"
    TicketPriority.create(priorities.split(";").map{|p| {:name => p } })
  end

  def self.down
    drop_table :ticket_priorities
  end
end
