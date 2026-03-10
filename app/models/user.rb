class User < ApplicationRecord
def password=(unhashed_password)
  self.password_digest = BCrypt::Password.create(unhashed_password)
end

def authenticate(unhashed_password)
  BCrypt::Password.new(self.password_digest) == unhashed_password
end
end
