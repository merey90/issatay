class Nova < ActiveRecord::Base
    belongs_to :user
    has_many :simple_images, as: :imageable, :dependent => :destroy
    accepts_nested_attributes_for :simple_images, allow_destroy: true
    
    validates :user_id, presence: true
    validates :title, presence: true
    validates :short_body, presence: true
end
