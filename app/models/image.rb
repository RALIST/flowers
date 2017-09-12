class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  has_attached_file :pic, styles: {small:['x100', :png],
                                   thumb: ['x300', :png],
                                   preview: ['x600', :png],
                                    large: ['x1080', :png]},
                                    convert_options: {
                                            large: "-quality 75 -strip",
                                            thumb: "-quality 75 -strip",
                                            preview: "-quality 75 -strip"},
                          default_url: ":style/missing.png"
  validates_attachment :pic, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
