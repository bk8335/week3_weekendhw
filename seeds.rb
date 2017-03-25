require('pry')
require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')

Ticket.delete_all
Customer.delete_all
Film.delete_all

customer1 = Customer.new({'name' => 'Ben Kinnard'})
customer2 = Customer.new({'name' => 'Max'})

customer1.save()
customer2.save()

film1 = Film.new({'name' => 'Lord of the Rings'})
film2 = Film.new({'name' => 'Kong'})
film3 = Film.new({'name' => 'Power Rangers'})

film1.save
film2.save
film3.save

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id })
ticket2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id })
ticket3 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film3.id })
ticket4 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id })

ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()

film1.name = "LoTR: The Fellowship of the Ring"
film1.update

film2.name = "Kong: Skull Island"
film2.update

customer1.name = "Ben"
customer1.update

ticket1.customer
ticket1.film

binding.pry
return nil