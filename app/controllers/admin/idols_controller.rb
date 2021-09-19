class Admin::IdolsController < ApplicationController
  before_action :set_idol, only: %i[ show edit update destroy ]

  def index
    @idols = Idol.all
  end

  def show
  end

  def new
    @idol = Idol.new
  end

  def edit
  end

  def create
    @idol = Idol.new(idol_params)

    if @idol.save
      redirect_to admin_idol_path(@idol), flash: {success: "Idol was successfully created."}
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @idol.update(idol_params)
      redirect_to admin_idol_path(@idol), flash: {success: "Idol was successfully updated."}
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @idol.destroy
    redirect_to admin_idols_url, flash: {success: "Idol was successfully destroyed."}
  end

  private
    def set_idol
      @idol = Idol.find(params[:id])
    end

    def idol_params
      params.require(:idol).permit(:name, :birth_date, :comment, :image, :image_cache)
    end
end
