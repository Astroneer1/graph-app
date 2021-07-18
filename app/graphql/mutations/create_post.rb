module Mutations
  class CreatePost < BaseMutation
    argument :user_id, Integer, required: true
    argument :message, String, required: true

    field :post, ObjectTypes::PostType, null: false

    def resolve(user_id:, message:)
      post = Post.new(user_id: user_id, message: message)
      post.save!

      { post: post }
    end
  end
end
