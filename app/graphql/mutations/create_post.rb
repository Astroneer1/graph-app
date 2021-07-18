module Mutations
  class CreatePost < BaseMutation
    argument :users_id, Integer, required: true
    argument :message, String, required: true

    field :post, ObjectTypes::PostType, null: false

    def resolve(users_id:, message:)
      post = Post.new(users_id: users_id, message: message)
      post.save!

      { post: post }
    end
  end
end
