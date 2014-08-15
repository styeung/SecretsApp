class Tag < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many(
    :secret_taggings,
    class_name: "SecretTagging",
    foreign_key: :tag_id,
    primary_key: :id
  )

  has_many :secrets, through: :secret_taggings, source: :secret
end
