class JoinsController < ApplicationController
  before_action :set_join, only: [:show, :edit, :update, :destroy]


  def show
  end

  def index
      @joins = Join.all
  end

  def edit
  end

  def new
    @join = Join.new
  end

  def create
    @join = Join.new(join_params)
    @join.user = current_user

    if @join.save
      redirect_to joins_path, notice: 'Votre document a été ajouté'
    else
      render :new
    end
  end

  def update
    if @join.update(join_params)
      redirect_to joins_path, notice: 'Votre document a été modifié'
    else
      render 'edit'
    end
  end

  def destroy
    @join.destroy
    redirect_to joins_path
  end

  private

  def set_join
    @join = Join.find(params[:id])
  end

  def join_params
    params.require(:join).permit(:file, :file_two)
  end
end
