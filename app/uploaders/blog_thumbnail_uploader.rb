class BlogThumbnailUploader < ApplicationUploader
  version :thumb do
    process resize_to_fill: [1600, 900, "Center"]
  end

  version :list_item do
    process resize_to_fill: [800, 450, "Center"]
  end
end
