class Pokemon

  attr_accessor :name, :type, :db, :id, :hp

  def initialize(name:, type:, db:, id:, hp: 60)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end


end
