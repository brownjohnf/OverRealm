class Entity
  include Neo4j::ActiveNode

  property :name, index: :exact
  property :slug, index: :exact, constraint: :unique

  validates :name,
    presence: true

  has_one :out, :born_in,
    model_class: 'Place',
    rel_class: 'LocatedIn'
end
