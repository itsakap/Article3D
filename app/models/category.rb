class Category
  include Mongoid::Document
  field :link, type: String
  field :launch_image, type: String
  has_many :articles
end
