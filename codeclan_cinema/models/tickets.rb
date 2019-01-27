require_relative('../db/sql_runner')

class Ticket

  attr_accessor :customer_id, :film_id
  attr_reader :id


  def initialize(options)
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id)
    VALUES ($1,$2) RETURNING id;"
    values = [@customer_id, @film_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    customers = SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM tickets"
    customers = SqlRunner.run(sql)
    return customers.map { |ticket| Ticket.new(film)}
  end

  def self.find(id)
    sql = "SELECT * FROM tickets WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)[0]
    ticket = Ticket.new(results)
    return ticket
  end

  def update
      sql = "
      UPDATE tickets SET (
        customer_id,
        film_id
        ) =
        (
          $1, $2
        )
        WHERE id = $3"
        values = [@customer_id, @film_id, @id]
        SqlRunner.run(sql, values)
      end

end
