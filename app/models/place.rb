class Place
  include Neo4j::ActiveNode

  property :name, index: :exact
  property :slug, index: :exact, constraint: :unique

  validates :name,
    presence: true

  has_many :in, :birthplace_of,
    model_class: 'Entity',
    rel_class: 'LocatedIn'
end
