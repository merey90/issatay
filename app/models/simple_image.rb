# encoding: UTF-8
class SimpleImage < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :imageable, presence: true
  validates :picture, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :title_kz, length: { maximum: 255 }
  validates :title_ru, length: { maximum: 255 }
  validates :description, length: { maximum: 65536 }
  validates :description_kz, length: { maximum: 65536 }
  validates :description_ru, length: { maximum: 65536 }
  
  validate  :picture_size

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 8.megabytes
        errors.add(:picture, "should be less than 8MB")
      end
    end
end