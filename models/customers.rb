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

  def self.all()
    sql = "SELECT * FROM customers"
    customer_list = SqlRunner.run(sql)
    result = customer_list.map {|customer| Customer.new(customer)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    result = SqlRunner.run(sql)
    return result
  end

end