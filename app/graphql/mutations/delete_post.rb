module Mutations
  class DeletePost < BaseMutation
    argument :id, Integer, required: true

    field :post, ObjectTypes::PostType, null: false

    def resolve(id:)
      post = Post.find(id).destroy

      { post: post }
    end
  end
end
