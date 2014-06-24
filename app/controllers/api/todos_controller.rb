class Api::TodosController < ApplicationController
  respond_to :json
  def index
    render json: Todo.all
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: todo, status: :ok
    else
      render json: todo.errors, status: :unprocessable_entity
    end
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update_attributes(todo_params)
      render  json: nil, status: :ok
    else
      render json: todo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Todo.find(params[:id]).destroy
    render json: nil, status: :ok
  end

  private
    def todo_params
      params.require(:todo).permit(:title, :complete)
    end
end
