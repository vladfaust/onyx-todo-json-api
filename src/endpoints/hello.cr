struct Endpoints::Hello
  include Onyx::HTTP::Endpoint

  params do
    query do
      type who : String = "Onyx"
    end
  end

  def call
    return Views::Hello.new(params.query.who)
  end
end
