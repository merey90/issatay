# encoding: UTF-8
class Paragraph < ActiveRecord::Base
  belongs_to :paragraphable, polymorphic: true
  has_many :simple_images, as: :imageable, :dependent => :destroy
end
