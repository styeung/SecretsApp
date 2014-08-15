class FriendshipsController < ApplicationController
  def create
    out_friend = current_user.id
    in_friend = params[:user_id]

    @friendship = Friendship.create!(
      out_friend_id: out_friend,
      in_friend_id: in_friend
    )

    redirect_to users_url
  end
end
