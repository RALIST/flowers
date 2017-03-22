class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  has_attached_file :pic, styles: {small:'x100',
                                   thumb: 'x300',
                                    large: 'x1080'},
                          default_url: ":style/missing.png"
  validates_attachment :pic, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
