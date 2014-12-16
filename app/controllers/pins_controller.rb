class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :newgirl, :edit, :update, :destroy]

  respond_to :html

  def index
    @pins = Pin.all
    respond_with(@pins)
  end

  def show #ERIN--this is READ
    respond_with(@pin)
  end

  def new
    @pin = Pin.new
    respond_with(@pin)
  end

  def edit
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.save
    redirect_to @pin, notice: 'I Made a Page!'
    else 
    render action: 'New Page'
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'I edited a page!'
    else
      render action: 'Edit page'
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  def newgirl
    @pin = Pin.new
    respond_with(@pin)
  end

  private

    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description)
    end
end
