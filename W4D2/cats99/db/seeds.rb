# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

COLORS = %w(orange black blue white grey)
SEX = %w(M F)
AGE = (15..100).to_a.map {|num| num * 60 * 60 * 24 * 30 }

Cat.create(name: "Bob", sex: SEX.sample, color: COLORS.sample, description: "Bob is a cat", birth_date: Time.now - AGE.sample )
Cat.create(name: "Jim", sex: SEX.sample, color: COLORS.sample, description: "Bob is a cat", birth_date: Time.now - AGE.sample )
Cat.create(name: "Jeff", sex: SEX.sample, color: COLORS.sample, description: "Bob is a cat", birth_date: Time.now - AGE.sample )
Cat.create(name: "Sue", sex: SEX.sample, color: COLORS.sample, description: "Bob is a cat", birth_date: Time.now - AGE.sample )
Cat.create(name: "Jen", sex: SEX.sample, color: COLORS.sample, description: "Bob is a cat", birth_date: Time.now - AGE.sample )
Cat.create(name: "Jill", sex: SEX.sample, color: COLORS.sample, description: "Bob is a cat", birth_date: Time.now - AGE.sample )
Cat.create(name: "Tim", sex: SEX.sample, color: COLORS.sample, description: "Bob is a cat", birth_date: Time.now - AGE.sample )
Cat.create(name: "Alph", sex: SEX.sample, color: COLORS.sample, description: "Bob is a cat", birth_date: Time.now - AGE.sample )
Cat.create(name: "dfjghsdlf", sex: SEX.sample, color: COLORS.sample, description: "Bob is a cat", birth_date: Time.now - AGE.sample )
Cat.create(name: "goop", sex: SEX.sample, color: COLORS.sample, description: "Bob is a cat", birth_date: Time.now - AGE.sample )
Cat.create(name: "steeve", sex: SEX.sample, color: COLORS.sample, description: "Bob is a cat", birth_date: Time.now - AGE.sample )
Cat.create(name: "why me", sex: SEX.sample, color: COLORS.sample, description: "Bob is a cat", birth_date: Time.now - AGE.sample )
Cat.create(name: "yolo", sex: SEX.sample, color: COLORS.sample, description: "Bob is a cat", birth_date: Time.now - AGE.sample )

CatRentalRequest.create(cat_id: 1, start_date: Time.now - 10000000, end_date: Time.now - 100000)
CatRentalRequest.create(cat_id: 2, start_date: Time.now - 10000000, end_date: Time.now - 100000)
CatRentalRequest.create(cat_id: 3, start_date: Time.now - 10000000, end_date: Time.now - 100000)
CatRentalRequest.create(cat_id: 4, start_date: Time.now - 10000000, end_date: Time.now - 100000)
CatRentalRequest.create(cat_id: 1, start_date: Time.now - 1000000, end_date: Time.now - 100000)
CatRentalRequest.create(cat_id: 1, start_date: Time.now - 10000000, end_date: Time.now - 100000)
