class Admin::BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]

  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)

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
    redirect_to admin_blogs_url, notice: "Blog was successfully destroyed."
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :piece_title, :outline, :thumbnail, :thumbnail_cache)
    end
end
