require_relative('../db/sql_runner')

class Customer

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO customers (name) VALUES ('#{@name}') RETURNING *"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

end