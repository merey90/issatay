class Carousel < ActiveRecord::Base
    belongs_to :user
    mount_uploader :picture, PictureUploader
    
    validates :user_id, presence: true
    validates :title, presence: true
    validates :url, presence: true
    validates :picture, presence: true
    
    validate  :picture_size

    private

        # Validates the size of an uploaded picture.
        def picture_size
            if picture.size > 8.megabytes
                errors.add(:picture, "should be less than 8MB")
            end
        end
end
