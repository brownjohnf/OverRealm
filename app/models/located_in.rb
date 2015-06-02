class LocatedIn
  include Neo4j::ActiveRel

  from_class Entity
  to_class Place
  type 'located_in'
end
