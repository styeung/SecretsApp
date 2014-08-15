class FriendshipsController < ApplicationController
  def create
    sleep 2
    out_friend = current_user.id
    in_friend = params[:user_id]

    @friendship = Friendship.create!(
      out_friend_id: out_friend,
      in_friend_id: in_friend
    )

    render json: @friendship
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy!

    head 200
  end
end
