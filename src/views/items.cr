struct Views::Items
  include Onyx::HTTP::View

  def initialize(@items : Enumerable(Models::Item))
  end

  json items: @items.map { |i| Views::Item.new(i) }
end
