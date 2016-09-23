#encoding: utf-8
class PressesController < ApplicationController
  before_action :set_press, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:create, :destroy, :edit]

  # GET /presses
  def index
    @presses = Press.paginate(page: params[:page], :per_page => 10).order('created_at DESC')
  end

  # GET /presses/1
  def show
  end

  # GET /presses/new
  def new
    @press = current_user.presses.new
    @press.simple_images.build
  end

  # GET /presses/1/edit
  def edit
    @press.simple_images.build
  end
  
  def add_simple_images
    if @press.blank?
     @press = current_user.presses.new
    end
    
    @press.simple_images.build
    render "presses/add_simple_image", :layout => false
  end

  # POST /presses
  def create
    @press = current_user.presses.new(press_params)

    if @press.save
      flash[:success] = "Press created!"
      redirect_to @press
    else
      render :new
    end
  end

  # PATCH/PUT /presses/1
  def update
    if @press.update(press_params)
      flash[:success] = "Press updated!"
      redirect_to @press
    else
      # render '%{I18n.locale}/presses/%{@press.id}/edit'
      render :edit
    end
  end

  # DELETE /presses/1
  def destroy
    @press.destroy
    flash[:success] = "Press was successfully destroyed"
    redirect_to request.referrer || presses_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_press
      @press = Press.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def press_params
      params.require(:press).permit(:title, :title_kz, :title_ru, :body, :body_kz, :body_ru, :short_body, :short_body_kz, :short_body_ru, :url,
      simple_images_attributes: [:picture, :title, :description, :title_kz, :description_kz, :title_ru, :description_ru, :_destroy, :id])
    end
end