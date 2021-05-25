class Api::V1::RemindersController < ApplicationController

    def index
        reminders = Reminder.all
        # renders route in a more compact way: data/attributes
        render json: ReminderSerializer.new(reminders)
    end

    def create
        reminder = Reminder.new(reminder_params)
        if reminder.save
            render json: ReminderSerializer.new(reminder), status: :accepted
        else
            # failed validations, throw up 422 error unprocessible
            render json: {errors: reminder.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def reminder_params
        params.require(:reminder).permit(:name, :description, :date, :time, :list_id)
    end

end
