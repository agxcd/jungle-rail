class User < ActiveRecord::Base

    has_secure_password
  
    validates_uniqueness_of :email, case_sensitive: false, presence: true
    validates :first_name, :last_name, :email ,presence: true
    validates :password, length: { minimum: 3 }

  end