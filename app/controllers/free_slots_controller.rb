class FreeSlotsController < ApplicationController
  def index
    @slots = Slot.where(occupied: false)

    render json: @slots.map(&:coordinates)
  end
end
