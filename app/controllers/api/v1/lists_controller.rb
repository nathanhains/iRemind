class Api::V1::ListsController < ApplicationController
    def index
        lists = List.all
        # renders route in a more compact way: data/attributes
        render json: ListSerializer.new(lists)
    end

    def create
        list = List.new(list_params)
        if list.save
            render json: list, status: :accepted
        else
            # failed validations, throw up 422 error unprocessible
            render json: {errors: list.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def list_params
        params.require(:list).permit(:name, :color)
        params.permit()
    end
end
