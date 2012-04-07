# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(first_name: 'Dmitry', last_name: 'Ivanov', email: "lin3r88@gmail.com", encrypted_password: '$2a$10$HZqyYq9XPEu4MWENamu2HOsQTABYHHNhXGZsj25IgqmF/w1sEXEzS', role_id: 1,  nick: 'sunrei', gender: true, about: 'here is short story about me', status: 'test status')