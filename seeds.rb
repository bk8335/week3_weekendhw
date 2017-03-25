require('pry')
require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')

Ticket.delete_all
Customer.delete_all
Film.delete_all

customer1 = Customer.new({'name' => 'Ben Kinnard'})
customer1.save()

film1 = Film.new({'name' => 'Lord of the Rings'})
film2 = Film.new({'name' => 'Kong'})

film1.save
film2.save

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id })
ticket1.save()

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