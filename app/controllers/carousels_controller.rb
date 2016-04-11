class CarouselsController < ApplicationController
  before_action :set_carousel, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:show, :index, :create, :update, :destroy, :edit]

  # GET /carousels
  # GET /carousels.json
  def index
    @carousels = Carousel.all
  end

  # GET /carousels/1
  # GET /carousels/1.json
  def show
  end

  # GET /carousels/new
  def new
    @carousel = current_user.carousels.new
  end

  # GET /carousels/1/edit
  def edit
  end

  # POST /carousels
  def create
    @carousel = current_user.carousels.new(carousel_params)

    if @carousel.save
      flash[:success] = "Carousel was successfully created."
      redirect_to @carousel
    else
      render :new
    end
  end

  # PATCH/PUT /carousels/1
  def update
    if @carousel.update(carousel_params)
      flash[:success] = "Carousel was successfully updated."
      redirect_to @carousel
    else
      flash[:danger] = flash_error_message(@carousel)
      render :edit
    end
  end

  # DELETE /carousels/1
  def destroy
    @carousel.destroy
    flash[:success] = "Carousel was successfully destroyed."
    redirect_to request.referrer || carousels_url
  end

  private
    def flash_error_message(arg)
      "Форма содержит #{arg.errors.count} ошибок: #{arg.errors.full_messages.join(', ')}"
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_carousel
      @carousel = Carousel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carousel_params
      params.require(:carousel).permit(:title, :title_kz, :title_ru, :description, :description_kz, :description_ru, :picture, :url)
    end
end
