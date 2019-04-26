class WorkoutsController < ApplicationController
    before_action :find_workout, only: [:show,:edit,:update,:destroy]
def index

end

def new
    @workout = Workout.new
end

def create
     @workout =Workout.new(workout_params)
     if @workout.save
        redirect_to @workout,notice: "workout was created"
     else
        render 'new'
     end
end

def edit

end

def update
      if @workout.update(workout_params)
        redirect_to @workout,notice: "workout was updated"
      else
        render 'edit'
      end
end

private

def workout_params
    params.require(:workout).permit(:date,:workout,:mood,:length)

end

def find_workout
    @workout= Workout.find(params[:id])

end



end
