class Customer < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10

  has_many :tickets
  belongs_to :state

  def address
    "#{address_1} #{address_2}"
  end

  def name
    "#{first_name} #{last_name}"
  end
  
end
