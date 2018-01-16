# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.delete_all
# User.create({id:1, username: 'Admin', email: "admin@ad.min", password: 'asdads', role: 'admin'})

User.delete_all
supplier = User.create :username => "Main Supplier", :email => "jean@supplier.com", :password => "asdasd", :role => "supplier", :id => '3'
User.create :username => "Server Admin",  :email => "jean@admin.com",    :password => "pulanmata",  :role => "supplier", :id => '1'


Product.delete_all
s8 = Product.create({id: 1, title: 'Telefon mobil Samsung Galaxy S8, 64GB, 4G, Midnight Black', user: supplier, price: 3000, thumbnail: File.new("/Users/cangheluta/Documents/school/Ruby On Rails/Chat fucked /app/assets/images/s8.jpg"), description:'Designul inovator al telefoanelor Galaxy S8 si S8+ incepe din interior. Am regandit fiecare componenta a telefonului pentru a depasi limitele ecranului unui smartphone.Astfel, vezi doar continut, fara rama. Este cel mai mare si mai captivant ecran pentru un dispozitiv mobil cu aceste dimensiuni. In plus, este usor de tinut un mana. Display-ul Infinity are un ecran perfect de la un capat la altul, care continua dincolo de marginile telefonului, formand o suprafata fina, fara asperitati sau muchii. Este sticla pura, neintrerupta. Acopera intreaga parte frontala a telefonului, imbinandu-se perfect cu carcasa din aluminiu. Rezultatul este un smartphone perfect simetric.'})
s82= Product.create({id: 2, title: 'Telefon mobil Samsung Galaxy s9999, 64GB, 4G, Midnight Black', user: supplier, price: 2000, thumbnail: File.new("/Users/cangheluta/Documents/school/Ruby On Rails/Chat fucked /app/assets/images/s8.jpg"), description:'Designul inovator al telefoanelor Galaxy S8 si S8+ incepe din interior. Am regandit fiecare componenta a telefonului pentru a depasi limitele ecranului unui smartphone.Astfel, vezi doar continut, fara rama. Este cel mai mare si mai captivant ecran pentru un dispozitiv mobil cu aceste dimensiuni. In plus, este usor de tinut un mana. Display-ul Infinity are un ecran perfect de la un capat la altul, care continua dincolo de marginile telefonului, formand o suprafata fina, fara asperitati sau muchii. Este sticla pura, neintrerupta. Acopera intreaga parte frontala a telefonului, imbinandu-se perfect cu carcasa din aluminiu. Rezultatul este un smartphone perfect simetric.'})


phones  = Category.create(:name =>"Phones")
techies = Category.create(:name =>"techies")

s8.categories = [phones, techies]
s82.categories = [phones, techies]

phones.products = [s8, s82]
techies.products = [s8, s82]


#rake db:drop db:create db:migrate


