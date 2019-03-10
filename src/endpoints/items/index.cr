struct Endpoints::Items::Index
  include Onyx::HTTP::Endpoint

  def call
    items = Onyx.query(Models::Item.all)
    return Views::Items.new(items)
  end
end
