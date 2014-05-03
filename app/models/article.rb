class Article
  include Mongoid::Document
  field :title, type: String
  field :audio_file, type: String
  field :image_files, type: Array
  field :printing_file, type: String
  field :video_file, type: String
  field :hypothesis, type: String
  field :description, type: String

  belongs_to :user
  belongs_to :category
end
