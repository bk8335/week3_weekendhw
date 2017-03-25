require('pry')
require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')

Ticket.delete_all
Customer.delete_all
Film.delete_all

customer1 = Customer.new({'name' => 'Ben Kinnard', 'funds' => 50.49})
customer2 = Customer.new({'name' => 'Max', 'funds' => 120.86})

customer1.save()
customer2.save()

film1 = Film.new({'name' => 'Lord of the Rings'})
film2 = Film.new({'name' => 'Kong'})
film3 = Film.new({'name' => 'Power Rangers'})

film1.save
film2.save
film3.save

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id, 'ticket_price' => 5 })
ticket2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id, 'ticket_price' => 12 })
ticket3 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film3.id, 'ticket_price' => 10 })
ticket4 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id, 'ticket_price' => 8 })

ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()

film1.name = "LoTR: The Fellowship of the Ring"
film1.update

film2.name = "Kong: Skull Island"
film2.update

customer1.name = "Ben"
customer1.funds -= ticket1.ticket_price
customer1.update

customer1.tickets_bought
customer2.tickets_bought

film1.attendance
film2.attendance
film3.attendance

binding.pry
return nil