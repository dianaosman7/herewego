class PinsController < ApplicationController
  before_action :set_pin, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /pins
def index
  @pins = Pin
            .order(created_at: :desc)
            .paginate(page: params[:page], per_page: 6)
end

  # GET /pins/1
  def show
  end

  # GET /pins/new
  def new
    @pin = current_user.pins.build
  end

  # GET /pins/1/edit
  def edit
  end

  # POST /pins
  def create
    @pin = current_user.pins.build(pin_params)

    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pins/1
  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Pin was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /pins/1
  def destroy
    @pin.destroy!
    redirect_to pins_path, notice: "Pin was successfully destroyed.", status: :see_other
  end

  private

  def set_pin
   @pin = Pin.find(params[:id])
  end

  def pin_params
    params.expect(pin: [:description, :image])
  end

  def correct_user
    @pin = current_user.pins.find_by(id: params[:id])
    redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
  end
end