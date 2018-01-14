class Opinion < ApplicationRecord
  belongs_to :user

  has_attached_file :proof,
                    url: "/system/:hash.:extension",
                    hash_secret: "abc123",
                    styles: { medium: "301x301>", thumb: "100x100>" }
  validates_attachment_content_type :proof, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
end
