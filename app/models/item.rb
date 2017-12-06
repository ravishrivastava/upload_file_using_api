class Item < ApplicationRecord
  before_validation :parse_image
	attr_accessor :image_base
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment :picture, presence: true
  do_not_validate_attachment_file_type :picture

  private
    def parse_image
	    image = Paperclip.io_adapters.for(image_base)
	    image.original_filename = "file.jpg"
	    self.picture = image
  	end
end
