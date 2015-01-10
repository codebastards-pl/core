# encoding: utf-8

class Shoppe::AttachmentUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :fog

  # Where should files be stored?
  def store_dir
    "attachment/#{model.id}"
  end

  # Returns true if the file is an image
  def image?(new_file)
    self.file.content_type.include? 'image'
  end

  # Returns true if the file is not an image
  def not_image?(new_file)
    !self.file.content_type.include? 'image'
  end

  # Create different versions of your uploaded files:
  version :thumb, :if => :image? do
    process :resize_to_fit => [250, 320]
  end

  version :wide, :if => :image? do
    process :resize_to_fit => [700, 700]
  end

end
