class StaticPagesController < ApplicationController
  def home
     @carousels = Carousel.all
  end

  def help
    unless StaticField.first.blank?
      if I18n.locale == :en
        @help = StaticField.first.help
      elsif I18n.locale == :kz
        @help = StaticField.first.help_kz.blank? ? StaticField.first.help : StaticField.first.help_kz
      elsif I18n.locale == :ru
        @help = StaticField.first.help_ru.blank? ? StaticField.first.help : StaticField.first.help_ru
      end
    end
  end
  
  def about
    unless StaticField.first.blank?
      if I18n.locale == :en
        @about = StaticField.first.about
      elsif I18n.locale == :kz
        @about = StaticField.first.about_kz.blank? ? StaticField.first.about : StaticField.first.about_kz
      elsif I18n.locale == :ru
        @about = StaticField.first.about_ru.blank? ? StaticField.first.about : StaticField.first.about_ru
      end
    end
  end
  
  def contact
    unless StaticField.first.blank?
      if I18n.locale == :en
        @contacts = StaticField.first.contacts
      elsif I18n.locale == :kz
        @contacts = StaticField.first.contacts_kz.blank? ? StaticField.first.contacts : StaticField.first.contacts_kz
      elsif I18n.locale == :ru
        @contacts = StaticField.first.contacts_ru.blank? ? StaticField.first.contacts : StaticField.first.contacts_ru
      end
    end
  end
  
  def biography
    unless StaticField.first.blank?
      if I18n.locale == :en
        @biography = StaticField.first.biography
      elsif I18n.locale == :kz
        @biography = StaticField.first.biography_kz.blank? ? StaticField.first.biography : StaticField.first.biography_kz
      elsif I18n.locale == :ru
        @biography = StaticField.first.biography_ru.blank? ? StaticField.first.biography : StaticField.first.biography_ru
      end
    end
  end
  
end
