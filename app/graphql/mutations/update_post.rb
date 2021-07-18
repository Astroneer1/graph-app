module Mutations
  class UpdatePost < BaseMutation
    argument :id, Integer, required: true
    argument :message, String, required: true

    field :post, ObjectTypes::PostType, null: false

    def resolve(id:, message:)
      post = Post.find(id)
      post.message = message
      post.tap(&:save!)

      { post: post }
    end
  end
end
