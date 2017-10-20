require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    @columns = DBConnection.execute2(<<-SQL).first
      SELECT
        *
      FROM
        #{table_name}
      LIMIT
        1



    SQL
    @columns = @columns.map(&:to_sym)


  end

  def self.finalize!

    columns.each do |col|
      define_method(col) do
        attributes[col]
      end
      define_method("#{col}=") do |new_value|
        attributes[col] = new_value
      end
    end

    # attributes.each do |k, v|
    #   define_method(k) do
    #     instance_variable_get("@#{k}")
    #   end
      # define_method("#{k}=") do |v|
      #   instance_variable_set("@#{k}", v)
      # end
    # end

  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.underscore.pluralize
  end

  def self.all

    res = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL

    parse_all(res)

  end

  def self.parse_all(results)
    # thing = self.class.new
    # results.map do |prop|
    #   thing.se
    # end


    results.map { |res| self.new(res) }
  end

  def self.find(id)
    res = DBConnection.execute(<<-SQL, id)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      where
        id = ?
    SQL

    parse_all(res).first
  end

  def initialize(params = {})
    # params.each do |k, v|
    #   define_method(k) do
    #     instance_variable_get("@#{k}")
    #   end
    #   define_method("#{k}=") do |v|
    #     instance_variable_set("@#{k}", v)
    #   end
    # end

    params.each do |k, v|
      parms_name = k.to_sym
      if !self.class.columns.include?(parms_name)
        raise "unknown attribute '#{k}'"
      else
        send("#{parms_name}=", v)
      end
    end
  end

  def attributes
    @attributes ||= {}

  end

  def attribute_values
    self.class.columns.map { |att| send(att) }
  end

  def insert
    columns = self.class.columns.drop(1)
    col_names = columns.map(&:to_s).join(", ")
    question_marks = (["?"] * columns.count).join(", ")

    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    update_line = self
      .class
      .columns
      .map { |att| "#{att} = ?"}
      .join(", ")

      DBConnection.execute(<<-SQL, *attribute_values, id)
        UPDATE
          #{self.class.table_name}
        SET
          #{update_line}
        WHERE
          #{self.class.table_name}.id = ?
      SQL

  end

  def save
    if id.nil?
      insert
    else
      update
    end
  end
end
