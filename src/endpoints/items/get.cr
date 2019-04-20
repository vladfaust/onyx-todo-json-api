struct Endpoints::Items::Get
  include Onyx::HTTP::Endpoint

  params do
    path do
      type id : Int32
    end
  end

  errors do
    # Return 404 if item is not found
    type ItemNotFound(404)
  end

  def call
    item = Onyx::SQL.query(Models::Item.where(id: params.path.id)).first?
    raise ItemNotFound.new unless item

    return Views::Item.new(item)
  end
end
