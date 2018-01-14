class Product < ApplicationRecord
  belongs_to :user

  has_attached_file :thumbnail,
                    url: "/system/:hash.:extension",
                    hash_secret: "abc123",
                    styles: { medium: ["301x301#", :jpg], high: ["700x700#", :jpg]}
  validates_attachment_content_type :thumbnail, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
end
