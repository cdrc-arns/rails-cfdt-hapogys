class BannersController < ApplicationController
  before_action only: [:index,:show, :edit, :update, :destroy]


  def show
  end

  def index
    @banners = Banner.all
  end

  def edit
    @banner = Banner.find(params[:id])

  end

  def new
    @banner = Banner.new
  end

  def create
    Banner.destroy_all
    @banner = Banner.new(banner_params)
    @banner.user = current_user

    if @banner.save
      redirect_to root_path, notice: 'Votre bannière a été ajouté'
    else
      render :new
    end
  end

  def update
    @banner = Banner.find(params[:id])
    if @banner.update(params[:id])
      redirect_to root_path, notice: 'Votre bannière a été modifié'
    else
      render 'edit'
    end
  end

  def destroy
    @banner.destroy
  end

  private

  # def set_banner
  #   @banner = Banner.find(params[:id])
  # end

  def banner_params
    params.require(:banner).permit(:photo, :id)
  end
end
