class ReservationsController < ApplicationController
	
	before_action :authenticate_user!

	def preload
		room = Room.find(params[:id])
		today = Date.today
		reservations = room.reservations.where("start_date >= ? OR end_date >= ?", today, today)

		render json: reservations
	end

	def new
		@rexervation = @room.reservations.new
	end

	def create
		@room = Room.find(params[:room_id])
				
		@reservation = current_user.reservations.create(reservation_params)
		@reservation.user_id = current_user.id
		#byebug
		redirect_to @reservation.room
	end

	private 

		def reservation_params
			params.require(:reservation).permit(:start_date, :end_date, :price, :room_id, :total)
		end
end