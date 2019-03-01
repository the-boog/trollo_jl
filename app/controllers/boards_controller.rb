class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  

  def index
    @boards = Board.all_boards(current_user.id)
  end

  def show
  end

  def new
    @board = Board.new
    render "form"
  end

  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      redirect_to boards_path
    else
      render "form"
    end
  end

  def edit
    render "form"
  end

  def update
    if @board.update(board_params)
      redirect_to boards_path
    else
      render "form"
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  private
  def board_params
    params.require(:board).permit(:name)
  end

  def set_board
    @board = Board.find_board(params[:id], current_user.id)
  end


end

