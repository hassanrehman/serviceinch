class SFactory
  class << self

    def all_states(refresh=false)
      @@all_states = nil if refresh
      @@all_states ||= State.all
      @@all_states
    end

    def all_ticket_statuses(refresh=false)
      @@all_ticket_statuses = nil if refresh
      @@all_ticket_statuses ||= TicketStatus.all
      @@all_ticket_statuses
    end
    
    def all_ticket_priorities(refresh=false)
      @@all_ticket_priorities = nil if refresh
      @@all_ticket_priorities ||= TicketPriority.all
      @@all_ticket_priorities
    end

    def all_users(refresh=false)
      @@all_users = nil if refresh
      @@all_users ||= User.all
      @@all_users
    end

    def all_ticket_categories(refresh=false)
      @@all_ticket_categories = nil if refresh
      @@all_ticket_categories ||= TicketCategory.all
      @@all_ticket_categories
    end

    def all_customers(refresh=false)
      @@all_customers = nil if refresh
      @@all_customers ||= Customer.all
      @@all_customers
    end


  end
end
