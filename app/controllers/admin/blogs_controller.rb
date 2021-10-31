class Admin::BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]

  def index
    @blogs = Blog.all.order(id: :desc)
  end

  def show
    @blog.distributors.build if @blog.distributors.blank?
  end

  def new
    @blog = Blog.new(idol_id: params[:idol_id])
    @blog.content_images.build
    @blog.distributors.build
  end

  def edit
    @blog.distributors.build if @blog.distributors.blank?
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.content_images.build if @blog.content_images.blank?

    if @blog.save
      redirect_to admin_blog_path(@blog), flash: {success: "Blog was successfully created."}
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to admin_blog_path(@blog), flash: {success: "Blog was successfully updated."}
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog.destroy
    redirect_to admin_blogs_url, flash: {success: "Blog was successfully destroyed."}
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(
        :idol_id,
        :title,
        :piece_title,
        :piece_release_on,
        :outline,
        :thumbnail,
        :thumbnail_cache,
        :piece_image,
        :piece_image_cache,
        :genre_list,
        :sale_list,
        :published,
        {content_images_attributes: [:id, :image, :image_cache, :comment, :_destroy]},
        {distributors_attributes: [:id, :name, :url, :_destroy]}
      )
    end
end
