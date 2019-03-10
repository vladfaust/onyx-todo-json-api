struct Views::Item
  include Onyx::HTTP::View

  def initialize(@item : Models::Item)
  end

  json(
    id: @item.id,
    completed: @item.completed,
    content: @item.content,
    createdAt: @item.created_at,
    updatedAt: @item.updated_at
  )
end
