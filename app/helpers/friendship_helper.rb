module FriendshipHelper

  def friendship_status(user, friend)
    friendship = Friendship.find_by_user_id_and_friend_id(user, friend)
    return "#{user.full_name} is not your friend (yet)." if friendship.nil?
    case friendship.status
    when 'requested'
      "#{user.full_name} would like to be your friend."
    when 'pending'
      "You have requested friendship from #{user.full_name}."
    when 'accepted'
      "#{user.full_name} is your friend."
    end
  end
end
