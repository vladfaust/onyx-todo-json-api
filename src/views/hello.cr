struct Views::Hello
  include Onyx::HTTP::View

  def initialize(@who : String)
  end

  json message: "Hello, #{@who}!"
end
