class RidesController < ApplicationController

    def new 
        @ride = Ride.new 
    end

    def create 
        @ride = Ride.create(ride_params)
        result = @ride.take_ride
        redirect_to user_path(@ride.user), notice: result
    end

    private

    def ride_params
        params.permit(:user_id, :attraction_id)
    end

end
