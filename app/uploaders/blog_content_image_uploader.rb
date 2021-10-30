class BlogContentImageUploader < ApplicationUploader
  version :thumb do
    process resize_to_fill: [1600, 900, "Center"]
  end
end
