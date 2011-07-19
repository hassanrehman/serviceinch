class TicketCategoriesController < ApplicationController

  def new
    @ticket_category = TicketCategory.new
    render :layout => false
  end

  def index
    @ticket_categories = TicketCategory.paginate :page => params[:page], :order => 'created_at DESC'
  end

  def edit
    @ticket_category = TicketCategory.find(params[:id])
    render :layout => false
  end

  def show
    @ticket_category = TicketCategory.find(params[:id])
    render :layout => false
  end

  def update
    @ticket_category = TicketCategory.find(params[:id])

    if @ticket_category.blank?
      flash[:error]  = "Invalid edit record"
      redirect_to ticket_categories_path and return false
    end
    success = @ticket_category.update_attributes(params[:ticket_category])
    SFactory.all_ticket_categories(true)  #update the locally maintained customers list from db

    if success && @ticket_category.errors.empty?
      flash[:notice] = "Ticket Category edited successfully..."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again."
    end
    redirect_to ticket_categories_path
  end

  def create
    @ticket_category = TicketCategory.new(params[:ticket_category])
    success = @ticket_category && @ticket_category.save
    SFactory.all_ticket_categories(true)  #update the locally maintained customers list from db
    
    if success && @ticket_category.errors.empty?      
      flash[:notice] = "Ticket Category added successfully..."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again."
    end
    redirect_to ticket_categories_path
  end
end
