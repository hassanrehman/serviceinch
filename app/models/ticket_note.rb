class TicketNote < ActiveRecord::Base
  belongs_to :ticket
  has_many :ticket_changes
  belongs_to :updated_by, :class_name => "User"
end
