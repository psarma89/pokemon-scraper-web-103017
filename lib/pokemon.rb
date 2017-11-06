require 'pry'

class Pokemon

  attr_reader :db
  attr_accessor :name, :type, :id, :hp

  def initialize(db, hp=60)
    @db = db
    @name = ""
    @type = ""
    @id = 0
    # @hp = 60 || nil
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT into pokemon (name, type) VALUES (\"#{name}\", \"#{type}\");")
  end

  def self.find(id, db)
    new_pokemon_info = db.execute("SELECT * FROM pokemon where id = (\"#{id}\")").flatten
    new_pokemon = Pokemon.new(db)
    new_pokemon.name = new_pokemon_info[1]
    new_pokemon.type = new_pokemon_info[2]
    new_pokemon.id = new_pokemon_info[0]
    new_pokemon
    # binding.pry
  end

  def alter_hp(hp_new,db)
    db.execute("UPDATE pokemon SET hp = #{hp_new} where name = \"#{self.name}\";")
    # self.hp = db.execute("select hp from pokemon where name = \"#{self.name}\";").flatten.first
    # self.hp = hp
    # binding.pry
    self.hp = hp_new
  end
end
