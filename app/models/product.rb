class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  belongs_to :user

  has_attached_file :thumbnail,
                    url: "/system/:hash.:extension",
                    hash_secret: "abc123",
                    styles: { medium: ["301x301#", :jpg], high: ["700x700#", :jpg]}
  validates_attachment_content_type :thumbnail, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
end
