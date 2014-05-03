class User
  include Mongoid::Document
  field :username, type: String
  field :hashed_password, type: String
  field :salt, type: String
  field :email_address, type: String
  field :first_name, type: String
  field :last_name, type: String
  before_save :hash_the_password

  private
    def hash_the_password
        unless self.hashed_password
          self.hashed_password = BCrypt::Password.create(self.password)
          self.password = self.password_confirmation = nil
        end
    end
end
