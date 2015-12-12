#encoding: utf-8
class PressesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :edit]
  before_action :set_press, only: [:show, :edit, :update, :destroy]

  # GET /presses
  # GET /presses.json
  def index
    @presses = Press.all
  end

  # GET /presses/1
  # GET /presses/1.json
  def show
  end

  # GET /presses/new
  def new
    @press = current_user.presses.new
    @press.paragraphs.new
  end

  # GET /presses/1/edit
  def edit
  end

  # POST /presses
  # POST /presses.json
  def create
    @press = current_user.presses.new(press_params)

      if @press.save
        flash[:success] = "Press created!"
        redirect_to @press
      else
        @feed_items = []
        render 'presses/new'
      end

  end

  # PATCH/PUT /presses/1
  # PATCH/PUT /presses/1.json
  def update

      if @press.update(press_params)
        flash[:success] = "Press updated!"
        redirect_to @press
      else
        @feed_items = []
        render 'presses/%{@press.id}/edit'
      end

  end

  # DELETE /presses/1
  # DELETE /presses/1.json
  def destroy
    @press.destroy
    flash[:success] = "Press was successfully destroyed"
    redirect_to request.referrer || presses_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_press
      @press = Press.find(params[:id])
      @press.body_kz = @press.body_kz.force_encoding('utf-8')
      @press.body_ru = @press.body_ru.force_encoding('utf-8')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def press_params
      params.require(:press).permit(:title, :title_kz, :title_ru, :body, :body_kz, :body_ru, :short_body, :short_body_kz, :short_body_ru, :image)
    end
end
