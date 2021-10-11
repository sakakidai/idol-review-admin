class BlogThumbnailUploader < ApplicationUploader
  version :thumb do
    # process resize_to_limit: [1600, 900]
    process resize_to_fill: [1600, 900, "Center"]
    process convert: 'png'
  end

  version :list_item do
    # process resize_to_limit: [800, 450]
    process resize_to_fill: [800, 450, "Center"]
    process convert: 'png'
  end
end
