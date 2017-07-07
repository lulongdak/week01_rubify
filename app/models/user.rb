class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :articles, dependent: :destroy
  has_many :comments
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
                            default_url: "/images/:style/missing.png",
                            hash_secret: "abc123", preserve_files: "true"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
