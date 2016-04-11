#encoding: utf-8
class NovasController < ApplicationController
  before_action :set_nova, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:create, :destroy, :edit]

  # GET /novas
  def index
    @novas = Nova.paginate(page: params[:page], :per_page => 10).order('created_at DESC')
  end

  # GET /novas/1
  def show
  end

  # GET /novas/new
  def new
    @nova = current_user.novas.new
  end

  # GET /novas/1/edit
  def edit
  end
  
  def add_simple_images
    if @nova.blank?
     @nova = current_user.novas.new
    end
    
    @nova.simple_images.build
    render "novas/add_simple_image", :layout => false
  end

  # POST /novas
  def create
    @nova = current_user.novas.new(nova_params)

    if @nova.save
      flash[:success] = "News created!"
      redirect_to @nova
    else
      render :new
    end
  end

  # PATCH/PUT /novas/1
  def update
    if @nova.update(nova_params)
      flash[:success] = "News updated!"
      redirect_to @nova
    else
      render 'novas/%{@nova.id}/edit'
    end
  end

  # DELETE /novas/1
  def destroy
    @nova.destroy
    flash[:success] = "News was successfully destroyed"
    redirect_to request.referrer || novas_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nova
      @nova = Nova.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nova_params
      params.require(:nova).permit(:title, :title_kz, :title_ru, :body, :body_kz, :body_ru, :short_body, :short_body_kz, :short_body_ru, :url,
      simple_images_attributes: [:picture, :title, :description, :title_kz, :description_kz, :title_ru, :description_ru, :_destroy, :id])
    end
end