# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Comment.delete_all
Picture.delete_all
Post.delete_all
User.delete_all
Subscription.delete_all
Role.delete_all

adminRole = Role.create(name: 'admin')

user1 = User.create!(first_name: 'Super', last_name: 'Admin', email: "admin@gmail.com", password: '123456',  nick: 'admin', gender: true, about: 'here is short story about me', status: 'test status', avatar: File.open('public/seedpics/1.jpg'))
user1.role_id = adminRole.id
user1.save

user2 = User.create!(first_name: 'Alexandr', last_name: 'Rudenko', email: "test1@gmail.com", password: '123456',  nick: 'test', gender: true, about: 'here is short story about me', status: 'test status1', avatar: File.open('public/seedpics/2.jpg'))
user3 = User.create!(first_name: 'Артур', last_name: 'Пирожков', email: "test2@gmail.com", password: '123456',   nick: 'test', gender: true, about: 'here is short story about me', status: 'test status2', avatar: File.open('public/seedpics/3.jpg'))
user4 = User.create!(first_name: 'Ivan', last_name: 'Fedorov', email: "test3@gmail.com", password: '123456',   nick: 'test', gender: true, about: 'here is short story about me', status: 'test status3', avatar: File.open('public/seedpics/4.jpg'))
user5 = User.create!(first_name: 'Anna', last_name: 'Petrova', email: "test4@gmail.com", password: '123456',  nick: 'test', gender: false, about: 'here is short story about me', status: 'test status4', avatar: File.open('public/seedpics/5.jpg'))
user6 = User.create!(first_name: 'Вероника', last_name: 'Захарова', email: "test5@gmail.com", password: '123456',   nick: 'test', gender: false, about: 'here is short story about me', status: 'test status5', avatar: File.open('public/seedpics/6.jpg'))


user1.subscriptions.create!(:leader_id => user2.id)
user1.subscriptions.create!(:leader_id => user3.id)
user1.subscriptions.create!(:leader_id => user4.id)
user1.subscriptions.create!(:leader_id => user5.id)
user1.subscriptions.create!(:leader_id => user6.id)
user2.subscriptions.create!(:leader_id => user3.id)
user2.subscriptions.create!(:leader_id => user4.id)
user2.subscriptions.create!(:leader_id => user5.id)
user2.subscriptions.create!(:leader_id => user6.id)

user3.subscriptions.create!(:leader_id => user4.id)
user3.subscriptions.create!(:leader_id => user5.id)
user3.subscriptions.create!(:leader_id => user6.id)

user4.subscriptions.create!(:leader_id => user5.id)
user4.subscriptions.create!(:leader_id => user6.id)

user5.subscriptions.create!(:leader_id => user6.id)

Post.create(:author_id => user4.id,:user_id => user1.id, :message => 'test post 3')
Post.create(:author_id => user3.id,:user_id => user1.id, :message => 'test post 4')
Post.create(:author_id => user2.id,:user_id => user1.id, :message => 'test post 5')
Post.create(:author_id => user1.id,:user_id => user1.id, :message => 'test post 6')

Post.create(:author_id => user5.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user3.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user4.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user2.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user6.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user1.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user5.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user3.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user4.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user2.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user6.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user1.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user5.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user3.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user4.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user2.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user6.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user1.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user5.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user3.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user4.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user2.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user6.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user1.id,:user_id => user1.id, :message => 'I want to see pagination')

Post.create(:author_id => user2.id,:user_id => user2.id, :message => 'I want to see pagination')
Post.create(:author_id => user6.id,:user_id => user3.id, :message => 'I want to see pagination')
Post.create(:author_id => user1.id,:user_id => user4.id, :message => 'I want to see pagination')
Post.create(:author_id => user5.id,:user_id => user5.id, :message => 'I want to see pagination')
Post.create(:author_id => user3.id,:user_id => user6.id, :message => 'I want to see pagination')
Post.create(:author_id => user4.id,:user_id => user3.id, :message => 'I want to see pagination')
Post.create(:author_id => user2.id,:user_id => user4.id, :message => 'I want to see pagination')
Post.create(:author_id => user6.id,:user_id => user2.id, :message => 'I want to see pagination')
Post.create(:author_id => user1.id,:user_id => user1.id, :message => 'I want to see pagination')
Post.create(:author_id => user5.id,:user_id => user4.id, :message => 'I want to see pagination')
Post.create(:author_id => user3.id,:user_id => user5.id, :message => 'I want to see pagination')
Post.create(:author_id => user4.id,:user_id => user3.id, :message => 'I want to see pagination')
Post.create(:author_id => user2.id,:user_id => user4.id, :message => 'I want to see pagination')
Post.create(:author_id => user6.id,:user_id => user5.id, :message => 'I want to see pagination')
Post.create(:author_id => user1.id,:user_id => user6.id, :message => 'I want to see pagination')

post1 = Post.create(:author_id => user6.id,:user_id => user1.id, :message => 'test post 1 with comments')

post1.comments << Comment.create(:user_id => user2.id, :comment => 'this is a 1 comment')
post1.comments << Comment.create(:user_id => user3.id, :comment => 'this is a 2 comment')
post1.comments << Comment.create(:user_id => user4.id, :comment => 'this is a 3 comment')
post1.comments << Comment.create(:user_id => user5.id, :comment => 'this is a 4 comment')

post2 = Post.create(:author_id => user5.id,:user_id => user1.id, :message => 'test post 2 with images')
post2.pictures << Picture.create(picture: File.open('public/seedpics/7.jpg'))
post2.pictures << Picture.create(picture: File.open('public/seedpics/8.jpg'))

post3 = Post.create!(:author_id => user6.id,:user_id => user1.id)
post3.pictures << Picture.create(picture: File.open('public/seedpics/9.jpg'))