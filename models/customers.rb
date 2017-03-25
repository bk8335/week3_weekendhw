require_relative('../db/sql_runner')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', #{@funds}) RETURNING *"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ('#{@name}', #{@funds}) WHERE id = #{@id}"
    result = SqlRunner.run(sql)
    return result
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE tickets.customer_id = #{@id}"
    film_list = SqlRunner.run(sql)
    result = film_list.map{|customer|Customer.new(customer)}
    return result
  end

  def tickets_bought()
    return films.length
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