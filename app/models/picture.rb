class Picture
  include Mongoid::Document
  include Mongoid::Paperclip

  embedded_in :article, :inverse_of => :pictures
  # attr_accessible :attachment

  has_mongoid_attached_file :attachment,
    :path           => ':attachment/:id/:style.:extension',
    :storage        => :s3,
    :bucket => "articlethreedee",
    :styles => {
      :original => ['1920x1680>', :jpg],
      :small    => ['100x100#',   :jpg],
      :medium   => ['250x250',    :jpg],
      :large    => ['500x500>',   :jpg]
    },
    :convert_options => { :all => '-background white -flatten +matte' }
    do_not_validate_attachment_file_type :attachment
end

