class Api::V1::RemindersController < ApplicationController
    before_action :find_reminder, only: [:show, :destroy]

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

    def destroy
        if @reminder.destroy
            render json: {message: "Successfully deleted", reminder: @reminder}
        else
            render json: {message: "Failed to delete"}
        end
    end

    private

    def find_reminder
        @reminder = Reminder.find(params[:id])
    end

    def reminder_params
        params.require(:reminder).permit(:name, :description, :date, :time, :list_id)
    end

end
