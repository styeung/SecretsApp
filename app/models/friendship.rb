class Friendship < ActiveRecord::Base
  validates :in_friend_id, :out_friend_id, presence: true
  validates :in_friend_id, uniqueness: { scope: :out_friend_id }

  belongs_to(
    :out_friend,
    :class_name => "User",
    :foreign_key => :out_friend_id,
    :primary_key => :id
  )

  belongs_to(
    :in_friend,
    :class_name => "User",
    :foreign_key => :in_friend_id,
    :primary_key => :id
  )

  def Friendship.can_friend?(out_id, in_id)
    return false if out_id === in_id
    return false if Friendship.exists?(out_friend_id: out_id, in_friend_id: in_id)

    true
  end
end
