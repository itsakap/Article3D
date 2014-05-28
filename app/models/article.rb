require 'paperclip'
class Article
  include Mongoid::Document
  include Mongoid::Paperclip
  field :title, type: String
  # field :audio_file, type: String
  field :image_files, type: Array
  field :printing_file, type: String
  field :video_file, type: String
  field :hypothesis, type: String
  field :description, type: String

  belongs_to :user
  belongs_to :category

  embeds_many :pictures, :cascade_callbacks => true, :validate => false
  accepts_nested_attributes_for :pictures
  # attr_accessible :pictures_attributes
  
  has_mongoid_attached_file :audio_file,
    :path => ':attachment/:id/:style.:extension',
    :storage => :s3,
    :bucket => "articlethreedee"
  do_not_validate_attachment_file_type :audio_file

end
