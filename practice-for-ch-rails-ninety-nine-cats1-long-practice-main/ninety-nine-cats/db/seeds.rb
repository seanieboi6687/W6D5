# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Cat.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('cats')

Cat.create!([
    {   name:'Harvey',
        color: 'White',
        birth_date: '2022/07/31',
        sex: 'M',
        description: 'He is a purebred Ragdoll which loves affentionate touch and full of joy! You can think of him as a dog of the cat world :D'
    },
    {
        name:'Chef',
        color: 'Black',
        birth_date: '2021/09/03',
        sex: 'M',
        description: "Funny, he is named after the 'Chef' character from 'South Park' 🤣"
    },
    {
        name:'Smol',
        color: 'Orange',
        birth_date: '2023/07/01',
        sex: 'F',
        description: "Her name is 'Smol' because she is tiny 🥹"
    }
])