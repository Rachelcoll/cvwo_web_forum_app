class User < ApplicationRecord
    has_secure_password

    validates_presence_of :email
    validates_uniqueness_of :email

    has_many :articles, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :reviews, dependent: :destroy
end
