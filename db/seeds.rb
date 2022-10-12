# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@author1 = Author.create!(name: " Alex", has_won_awards: false, books_written: 1)
@book1 = @author1.books.create!(title: "Spiderwick", best_seller: true, pages: 120)
@book4 = @author1.books.create!(title: "Wickspider", best_seller: false, pages: 300)
@author2 = Author.create!(name: " Peyton", has_won_awards: true, books_written: 2)
@book2 = @author2.books.create!(title: "Harry Potter", best_seller: true, pages: 140)
@author3 = Author.create!(name: " Gabe", has_won_awards: false, books_written: 3)
@book3 = @author3.books.create!(title: "The Series of Unfortunate events", best_seller: true, pages: 100)
