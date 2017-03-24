require_relative('../db/sql_runner')

class Film

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @name= options['name']
  end

  def save()
    sql = "INSERT INTO films (name) VALUES ('#{@name}') RETURNING *"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

end