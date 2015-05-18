class User < ActiveRecord::Base
    has_secure_password

    def admin?
      self.admin
    end
end
