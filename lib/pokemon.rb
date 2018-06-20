class Pokemon

  attr_accessor :name, :type, :db, :id, :hp

  def initialize(name:, type:, db:, id:, hp: 60)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, database)
    database.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_results = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
    Pokemon.new(id: pokemon_results[0], name: pokemon_results[1], type: pokemon_results[2], hp: pokemon_results[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

end
