struct Endpoints::Items::Create
  include Onyx::HTTP::Endpoint

  params do
    # Will attempt to parse JSON params even if
    # "Content-Type" header is not "application/json"
    json require: true do
      type content : String
    end
  end

  def call
    # Insert the model into the database
    #

    item = Models::Item.new(content: params.json.content)
    item = Onyx::SQL.query(item.insert.returning(Models::Item)).first

    # Return the success status
    #

    status(201)
    return Views::Item.new(item)
  end
end
