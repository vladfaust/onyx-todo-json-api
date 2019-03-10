class Models::Item
  include Onyx::SQL::Model

  schema items do
    pkey id : Int32
    type completed : Bool, not_null: true, default: true
    type content : String, not_null: true
    type created_at : Time, not_null: true, default: true
    type updated_at : Time
  end
end
