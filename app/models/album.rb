class Album < ActiveRecord::Base
    belongs_to :user
    has_many :simple_images, as: :imageable, :dependent => :destroy
    accepts_nested_attributes_for :simple_images, allow_destroy: true
    
    mount_uploader :picture, PictureUploader
    
    validates :user_id, presence: true
    validates :title, presence: true
    
    validate  :picture_size

    private

        # Validates the size of an uploaded picture.
        def picture_size
          if picture.size > 8.megabytes
            errors.add(:picture, "should be less than 8MB")
          end
        end
end
