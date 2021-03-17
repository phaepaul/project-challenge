module LikesHelper

  def get_user_dog_likes(dog_id, user_id)
    return if !user_id

    dog = Dog.find(dog_id)
    user_likes = dog.likes.where(user_id: user_id)
    like_ids = user_likes.ids.first
  end

end