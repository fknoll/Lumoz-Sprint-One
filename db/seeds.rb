# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

freddyknoll_company = Company.find_or_create_by(name: 'freddyknoll', username: 'lumozproxy[freddyknoll]', password: 'LUMOZ', host: '13.74.172.139', port: '1521', service_name: 'lumoz000pdb')
igorbilan_company = Company.find_or_create_by(name: 'igorbilan', username: 'lumozproxy[igorbilan]', password: 'LUMOZ', host: '13.74.172.139', port: '1521', service_name: 'lumoz000pdb')

freddyknoll_user = User.create(name: 'freddy', email: 'freddy@example.com', password: '12345678', company: freddyknoll_company)
igorbilan_user = User.create(name: 'igor', email: 'igor@example.com', password: '12345678', company: igorbilan_company)
