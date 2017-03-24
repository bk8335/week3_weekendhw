require('pry')
require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')

customer1 = Customer.new({'name' => 'Ben Kinnard'})
customer1.save()

film1 = Film.new({'name' => 'Lord of the Rings'})
film2 = Film.new({'name' => 'Kong'})

film1.save
film2.save

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id })
ticket1.save()

ticket1.customer

binding.pry
return nil