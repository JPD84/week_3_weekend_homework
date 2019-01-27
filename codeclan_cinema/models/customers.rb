require_relative('../db/sql_runner')

class Customer

  attr_accessor :name, :funds
  attr_reader :id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end


  def save()
    sql = "INSERT INTO customers (name, funds)
    VALUES ($1,$2) RETURNING id;"
    values = [@name, @funds]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    customers = SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)[0]
    customer = Customer.new(results)
    return customer
  end

  def self.all
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return customers.map { |customer| Customer.new(customer)}
  end

  def update
    sql = "
    UPDATE customers SET (
      name,
      funds
      ) =
      (
        $1, $2
      )
      WHERE id = $3"
      values = [@name, @funds, @id]
      SqlRunner.run(sql, values)
    end

    def films()
      sql = "SELECT films.*
      FROM films
      INNER JOIN tickets
      ON tickets.film_id = films.id
      WHERE customer_id =$1"
      values = [@id]
      film_data = SqlRunner.run(sql, values)
      return film_data.map {|film| Film.new(film)}
    end

    def buy_a_ticket(film)
      @funds -= film.price
      ticket = Ticket.new({'customer_id' => customer2.id, 'film.id' => film.id})
      update()
      return ticket()
    end
  end

  def ticket_bought_by_customer(film)
    @funds -= film.price()
    update()
  end
