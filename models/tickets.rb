require_relative('../db/sql_runner')

class Ticket

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @film_id = options['film_id'].to_i
    @customer_id = options['customer_id'].to_i
    # @showing
  end

  def save()
    sql = "INSERT INTO tickets (film_id, customer_id) VALUES (#{@film_id}, #{@customer_id}) RETURNING *"
    ticket = SqlRunner.run(sql).first()
    @id = ticket['id'].to_i
  end

  def customer
    sql = "SELECT * from customers WHERE id = #{@customer_id}"
    customer = SqlRunner.run(sql).first()
    return Customer.new(customer)
  end

end