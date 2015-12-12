# encoding: UTF-8
class SimpleImage < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
end
