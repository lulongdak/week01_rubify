class Photo < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },
                            default_url: "/images/:style/missing.png",
                            hash_secret: "abc123", preserve_files: "true"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
