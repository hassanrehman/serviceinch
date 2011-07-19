class Ticket < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10

  belongs_to :customer
  belongs_to :ticket_category
  belongs_to :ticket_priority
  belongs_to :ticket_status

  belongs_to :assignee, :class_name => "User"
  belongs_to :added_by, :class_name => "User"

  has_many :ticket_notes

  validates_presence_of :subject, :ticket_status_id, :ticket_priority_id

  def ticket_change_foreign_table(attr_name, new_value, params)
    new_value = new_value.to_i   #if a foreign table is involved, new_value must be the foreign key
    old_value = eval(attr_name).to_i

    puts "old_value: #{old_value}, new_value => #{new_value}"
    if old_value != new_value
      puts "new value: #{params[:klass].find(new_value).send(params[:attr])}"
      return TicketChange.new({
        :changed_field => params[:changed_field],
        :old_value => old_value == 0 ? "None" : params[:klass].find(old_value).send(params[:attr]),
        :new_value => new_value == 0 ? "None" : params[:klass].find(new_value).send(params[:attr])
      })
    end
    return nil
  end
  
  def ticket_change_direct(attr_name, new_value, params)
    old_value = eval(attr_name)
    if old_value != new_value
      return TicketChange.new({
        :changed_field => params[:changed_field],
        :old_value => old_value,
        :new_value => new_value
      })
    end
    return nil
  end

  def get_ticket_change_story(attr_name, new_value)
    settings_map = {
      "ticket_status_id" => {:changed_field => "Status", :attr => "name", :klass => TicketStatus},
      "ticket_category_id" => {:changed_field => "Ticket Category", :attr => "name", :klass => TicketCategory},
      "ticket_priority_id" => {:changed_field => "Priority", :attr => "name", :klass => TicketPriority},
      "assignee_id" => {:changed_field => "Assigned To", :attr => "name", :klass => User},
      "customer_id" => {:changed_field => "Customer", :attr => "name", :klass => Customer},
      "subject" => {:changed_field => "Subject"},
      "description" => {:changed_field => "Description"}
    }

    puts "attr_name: #{attr_name}"

    if %w(ticket_category_id ticket_status_id ticket_priority_id assignee_id customer_id).include?(attr_name)
      ticket_change_foreign_table(attr_name, new_value, settings_map[attr_name])
    elsif %w(subject description).include?(attr_name)
      ticket_change_direct(attr_name, new_value, settings_map[attr_name])
    end
  end
  
end
