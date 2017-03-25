require_relative('../db/sql_runner')

class Film

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name= options['name']
  end

  def save()
    sql = "INSERT INTO films (name) VALUES ('#{@name}') RETURNING *"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (name) = ('#{@name}') WHERE id = #{@id}"
    result = SqlRunner.run(sql).first
  end

  def self.all
    sql = "SELECT * FROM films"
    film_list = SqlRunner.run(sql)
    result = film_list.map {|film| Film.new(film) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    result = SqlRunner.run(sql)
    return result
  end

end