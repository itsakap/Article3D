class User
  include Mongoid::Document
  attr_accessor :password, :password_confirmation
  field :username, type: String
  field :hashed_password, type: String
  field :salt, type: String
  field :email_address, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :avatar_path, type: String
  before_save :hash_the_password
  has_many :articles
  validates_uniqueness_of :username

  def passes_authentication?(password_to_check)
    BCrypt::Password.new(self.hashed_password).is_password?(password_to_check)
  end

  private
    def hash_the_password
        unless self.hashed_password
          self.hashed_password = BCrypt::Password.create(self.password)
          self.password = self.password_confirmation = nil
        end
    end
end
