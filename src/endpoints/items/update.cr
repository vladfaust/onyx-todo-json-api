struct Endpoints::Items::Update
  include Onyx::HTTP::Endpoint

  params do
    path do
      type id : Int32
    end

    json require: true do
      type completed : Bool?
      type content : String?
    end
  end

  # Define HTTP errors
  #

  errors do
    # Return 400 if there is nothing to update
    type NothingToUpdate(400)

    # Return 404 if item is not found
    type ItemNotFound(404)
  end

  def call
    # Validate the request
    #

    raise NothingToUpdate.new if params.json.content.nil? && params.json.completed.nil?

    # Fetch the item from DB
    #

    item = Onyx.query(Models::Item.where(id: params.path.id)).first?
    raise ItemNotFound.new unless item

    # Create a new changeset with a snapshot of actual item's values
    #

    changeset = item.changeset

    if content = params.json.content
      changeset.update(content: content)
    end

    unless params.json.completed.nil?
      changeset.update(completed: params.json.completed.not_nil!)
    end

    # Halt if there are no actual changes
    raise NothingToUpdate.new if changeset.empty?

    # Update the updated_at field
    changeset.update(updated_at: Time.now)

    # Update the item with modified changeset returning itself
    #

    item = Onyx.query(item.update(changeset).returning(Models::Item)).first
    return Views::Item.new(item)
  end
end
