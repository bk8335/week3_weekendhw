require_relative('../db/sql_runner')

# The combined table doesn't require an update method because the information in it will be updated by the other tables right?

class Ticket

  attr_reader :id
  attr_accessor :ticket_price

  def initialize(options)
    @id = options['id'].to_i
    @film_id = options['film_id'].to_i
    @customer_id = options['customer_id'].to_i
    @ticket_price = options['ticket_price'].to_i
    # @showing
  end

  def save()
    sql = "INSERT INTO tickets (film_id, customer_id, ticket_price) VALUES (#{@film_id}, #{@customer_id}, #{@ticket_price}) RETURNING *"
    ticket = SqlRunner.run(sql).first()
    @id = ticket['id'].to_i
  end

  def customer
    sql = "SELECT * from customers WHERE id = #{@customer_id}"
    customer = SqlRunner.run(sql).first()
    return Customer.new(customer)
  end

  def film
    sql = "SELECT * FROM films WHERE (id = #{@film_id})"
    film = SqlRunner.run(sql).first()
    return Film.new(film)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    ticket_list = SqlRunner.run(sql)
    result = ticket_list.map {|ticket| Ticket.new(ticket)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM tickets"
    result = SqlRunner.run(sql)
    return result
  end

end