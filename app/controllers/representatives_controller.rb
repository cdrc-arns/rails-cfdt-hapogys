class RepresentativesController < ApplicationController
  before_action :set_representative, only: [:show, :edit, :update, :destroy]


  def show
  end

  def index
      @representatives = Representative.all
  end

  def edit
  end

  def new
    @representative = Representative.new
  end

  def create
    @representative = Representative.new(representative_params)
    @representative.user = current_user

    if @representative.save
      redirect_to representatives_path, notice: 'Votre élu a été ajouté'
    else
      render :new
    end
  end

  def update
    if @representative.update(representative_params)
      redirect_to representatives_path, notice: 'Votre élu a été modifié'
    else
      render 'edit'
    end
  end

  def destroy
    @representative.destroy
    redirect_to representatives_path
  end

  private

  def set_representative
    @representative = Representative.find(params[:id])
  end

  def representative_params
    params.require(:representative).permit(:titre, :description, :email, :photo)
  end
end
