class IdolImageUploader < ApplicationUploader
  version :thumb do
    process resize_to_fill: [300, 300, "Center"]
  end
end
