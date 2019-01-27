require_relative('../db/sql_runner')

class Film

  attr_accessor :title, :price
  attr_reader :id


  def initialize(options)
    @title = options['title']
    @price = options['price'].to_i
    @id = options['id'].to_i if options['id']
  end


  def save()
    sql = "INSERT INTO films (title, price)
    VALUES ($1,$2) RETURNING id;"
    values = [@title, @price]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def self.delete_all()
    sql = "DELETE FROM films"
    customers = SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM films"
    customers = SqlRunner.run(sql)
    return customers.map { |film| Film.new(film)}
  end

  def self.find(id)
    sql = "SELECT * FROM films WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)[0]
    film = Film.new(results)
    return film
  end

  def update
    sql = "
    UPDATE films SET (
      title,
      price
      ) =
      (
        $1, $2
      )
      WHERE id = $3"
      values = [@title, @price, @id]
      SqlRunner.run(sql, values)
    end

    def customers()
      sql = "SELECT customers.*
      FROM customers
      INNER JOIN tickets
      ON tickets.customer_id = customers.id
      WHERE film_id =$1"
      values = [@id]
      customer_data = SqlRunner.run(sql, values)
      return customer_data.map {|customer| Customer.new(customer)}
    end

    def ticket_count()
      sql = "SELECT * FROM tickets WHERE film_id = $1"
      values =[@id]
      ticket_sales = SqlRunner.run(sql, values)
      return ticket_sales.count
    end
    # using the id on this instance of a film, look up all the tickets in the ticket table

    #  - write a sql query to look up ticket table (look back at customers/pizza_orders)
    #  - define my values array
    #  - run SqlRunner and assign the result to a variable

    # count those tickets

    #  - call .count() on the result









  end
