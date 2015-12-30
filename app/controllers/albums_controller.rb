class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:create, :destroy, :edit]

  # GET /albums
  def index
    @albums = Album.all
  end

  # GET /albums/1
  def show
  end

  # GET /albums/new
  def new
    @album = current_user.albums.new
  end

  # GET /albums/1/edit
  def edit
  end

  def add_simple_images
    if @album.blank?
     @album = current_user.albums.new
    end
    
    @album.simple_images.build
    render "albums/add_simple_image", :layout => false
  end

  # POST /albums
  def create
    @album = current_user.albums.new(album_params)

    if @album.save
      flash[:success] = "Album was successfully created!"
      redirect_to @album
    else
      render :new
    end
  end

  # PATCH/PUT /albums/1
  def update
    if @album.update(album_params)
      flash[:success] = "Album was successfully updated!"
      redirect_to @album
    else
      flash[:danger] = flash_error_message(@album)
      redirect_to :back
    end
  end

  # DELETE /albums/1
  def destroy
    @album.destroy
    flash[:success] = "Album was successfully destroyed"
    redirect_to request.referrer || albums_url
  end

  private
  
    def flash_error_message(arg)
      "Форма содержит #{arg.errors.count} ошибок: #{arg.errors.full_messages.join(', ')}"       
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title, :title_kz, :title_ru, :description, :description_kz, :description_ru, :picture,
      simple_images_attributes: [:picture, :title, :description, :title_kz, :description_kz, :title_ru, :description_ru, :_destroy, :id])
    end
end
