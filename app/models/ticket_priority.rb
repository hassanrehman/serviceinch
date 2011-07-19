class TicketPriority < ActiveRecord::Base
  has_many :tickets
end
