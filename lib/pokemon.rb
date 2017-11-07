require 'pry'

class Pokemon

  attr_accessor :db, :name, :type, :id, :hp

  def initialize(id:, name:, type:, db: {}, hp: 60)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    #binding.pry
    #pokemon = Pokemon.new(id: , name: name, type: type, db: db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
  end

  def self.find(id, db)

    db_find = db.execute("select name, type, hp from pokemon where id= '#{id}'").flatten
    # binding.pry
    Pokemon.new(id:id, name:db_find[0], type: db_find[1], hp: db_find[2])
    # binding.pry

  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE name = '#{@name}';")
    # binding.pry
    @hp = new_hp
  end

end
