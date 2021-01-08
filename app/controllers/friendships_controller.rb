class FriendshipsController < ApplicationController
  def create
    current_user.friendships.build(friend_id: params[:friend])
    redirect_to my_friends_path, notice: 'Following friend' if current_user.save
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    redirect_to my_friends_path, notice: 'Stopped following'
  end
end
