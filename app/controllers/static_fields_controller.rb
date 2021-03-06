class StaticFieldsController < ApplicationController
  before_action :admin_user, only: [:new, :create]

  # GET /static_fields/new
  def new
      if StaticField.first.blank?
        @static_field = StaticField.new      
      else
        @static_field = StaticField.first  
      end
  end

  # POST /static_fields
  def create
      
    if StaticField.first.blank?
      @static_field = StaticField.new(field_params)
      if @static_field.save
        flash[:success] = "Data was successfully created."
        redirect_to biography_path
      else
        render :new
      end
    else
      @static_field = StaticField.first
      if @static_field.update(field_params)
        flash[:success] = "Data was successfully updated."
        redirect_to biography_path
      else
        flash[:danger] = flash_error_message(@static_field)
        render :new
      end
    end
  end

  private
    def flash_error_message(arg)
      "Форма содержит #{arg.errors.count} ошибок: #{arg.errors.full_messages.join(', ')}"
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_fields
      @static_field = StaticField.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def field_params
      params.require(:static_field).permit(:biography, :biography_kz, :biography_ru, :contacts, :contacts_kz, :contacts_ru, :about, :about_kz, :about_ru, :home, :home_kz, :home_ru, :help, :help_kz, :help_ru)
    end
end
