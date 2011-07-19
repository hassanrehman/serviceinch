class TicketChange < ActiveRecord::Base
  belongs_to :ticket_note
end
