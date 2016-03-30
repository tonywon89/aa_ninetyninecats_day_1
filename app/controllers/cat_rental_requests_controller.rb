class CatRentalRequestsController < ApplicationController

  def index
    @cat = Cat.find(params[:cat_id])
    @cat_rentals = @cat.cat_rental_requests.order(:start_date)
    render :index
  end

  # def show
  #   @cat_rental = CatRentalRequest.find(params[:id])
  #   render :show
  # end

  def new
    @cat_rental = CatRentalRequest.new
    @cats = Cat.all
    render :new
  end

  def create
    @cat_rental = CatRentalRequest.new(rental_params)
    @cats = Cat.all
    if @cat_rental.save!
      redirect_to cat_cat_rental_requests_url(@cat_rental)
    else
      render :new
    end
  end

  def edit
    @cat_rental = CatRentalRequest.find(params[:id])
    @cats = Cat.all
    render :edit
  end

  def update
    @cat_rental = CatRentalRequest.find(params[:id])
    @cat_rental.update(rental_params)
    redirect_to cat_url(@cat_rental)
  end

  def approve
    @cat_rental = CatRentalRequest.find(params[:id])
    @cat_rental.approve!
    redirect_to cat_url(@cat_rental)
  end

  def deny
    @cat_rental = CatRentalRequest.find(params[:id])
    @cat_rental.deny!
    redirect_to cat_url(@cat_rental)
  end

  private
  def rental_params
    params.require(:rental).permit(
      :cat_id, :start_date, :end_date
    )
  end

end
