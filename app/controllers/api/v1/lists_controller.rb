class Api::V1::ListsController < ApplicationController
    before_action :find_list, only: [:update, :destroy]

    def index
        lists = List.all
        # renders route in a more compact way: data/attributes
        render json: ListSerializer.new(lists)
    end

    def create
        list = List.new(list_params)
        if list.save
            render json: ListSerializer.new(list), status: :accepted
        else
            # failed validations, throw up 422 error unprocessible
            render json: {status: 400, errors: list.errors.full_messages.join(", ")}, status: :unprocessable_entity
        end
    end

    def update
        if @list.update(list_params)
            render json: @list
        else
            render json: { status: 400, errors: @list.errors.full_messages.join(", ")}, status: :unprocessable_entity
        end
    end

    private

    def find_list
        @list = List.find(params[:id])
    end

    def list_params
        params.require(:list).permit(:name, :color)
    end
end
