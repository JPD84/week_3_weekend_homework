require ('pry')
require_relative("./customers")
require_relative("./films")
require_relative("./tickets")


Ticket.delete_all()
Film.delete_all()
Customer.delete_all()


customer1 = Customer.new({'name' => 'Jim Beam', 'funds' => '35'})
customer1.save

customer2 = Customer.new({'name' => 'Jack Daniels', 'funds' => '30'})
customer2.save

customer3 = Customer.new({'name' => 'Captain Morgan', 'funds' => '42'})
customer3.save

customer4 = Customer.new({'name' => 'Morgan Spice', 'funds'  => '25'})
customer4.save


film1 = Film.new({'title' => 'Suicide Squad', 'price' =>  '5'})
film1.save

film2 = Film.new({'title' => 'Deadpool', 'price' =>  '5'})
film2.save

film3 = Film.new({'title' => 'Thor Ragnarock', 'price' => '5'})
film3.save

film4 = Film.new({'title' => 'Avengers', 'price' => '5'})
film4.save

film5 = Film.new({'title' => 'Guardians of the Galaxy','price' => '5'})
film5.save

film6 = Film.new({'title' => 'Ant-man', 'price' => '5'})
film6.save

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save

ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
ticket2.save

ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id})
ticket3.save

ticket4 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film4.id})
ticket4.save

ticket5 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket5.save

ticket6 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film5.id})
ticket6.save

ticket7 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film6.id})
ticket7.save

ticket8 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film6.id})
ticket8.save







binding.pry
nil
