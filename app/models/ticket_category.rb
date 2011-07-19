class TicketCategory < ActiveRecord::Base
  #will_paginate params
  cattr_reader :per_page
  @@per_page = 10

  has_many :tickets

  validates_presence_of :name
  validates_uniqueness_of :name
  
end
