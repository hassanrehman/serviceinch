class CreateTicketStatuses < ActiveRecord::Migration
  def self.up
    create_table :ticket_statuses do |t|
      t.string :name
      t.string :comments

      t.timestamps
    end
    statuses = "New;In Progress;Resolved;Closed"
    TicketStatus.create(statuses.split(";").map{|n| {:name => n} })
  end

  def self.down
    drop_table :ticket_statuses
  end
end
