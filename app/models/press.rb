# encoding: UTF-8
class Press < ActiveRecord::Base
    belongs_to :user
    has_many :paragraphs, as: :paragraphable, :dependent => :destroy
    has_many :simple_images, as: :imageable, :dependent => :destroy
    
    validates :title, presence: true
    validates :short_body, presence: true
    validates :body, presence: true
end
