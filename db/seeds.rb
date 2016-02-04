# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

darth = Client.create(
  name: "Darth",
  surname: "Vader",
  birthday: Date.new(1977, 5, 25),
  gender: "Masculino",
  kind_document: "DNI",
  document: 25900578,
  cuil_cuit: "20-25900578-5"
)

homero = Client.create(
  name: "Homero Max",
  surname: "Power",
  birthday: Date.new(1956, 5, 12),
  gender: "Masculino",
  kind_document: "DNI",
  document: 12587412,
  cuil_cuit: "20-12587412-5"
)

bruce = Client.create(
  name: "Bruce",
  surname: "Willis",
  birthday: Date.new(1955, 3, 19),
  gender: "Masculino",
  kind_document: "DNI",
  document: 12357951,
  cuil_cuit: "20-12357951-5"
)

susy = Client.create(
  name: "Susana",
  surname: "Martinez",
  birthday: Date.new(1967, 1, 25),
  gender: "Femenino",
  kind_document: "DNI",
  document: 25364158,
  cuil_cuit: "27-25364158-5"
)

mica = Client.create(
  name: "Micaela",
  surname: "Queen",
  birthday: Date.new(1985, 11, 7),
  gender: "Femenino",
  kind_document: "DNI",
  document: 29874562,
  cuil_cuit: "27-29874562-5"
)

agusto = Client.create(
  name: "Agusto",
  surname: "Roberts",
  birthday: Date.new(1980, 10, 8),
  gender: "Masculino",
  kind_document: "DNI",
  document: 12857985,
  cuil_cuit: "20-12857985-5"
)

lee = Client.create(
  name: "Lee",
  surname: "Miyagi",
  birthday: Date.new(1940, 2, 15),
  gender: "Masculino",
  kind_document: "DNI",
  document: 7987540,
  cuil_cuit: "23-7987540-5"
)

#Contactos

Contact.create(
  client: darth,
  kind: 0,
  data: "vader@gmail.com"
)

Contact.create(
  client: darth,
  kind: 3,
  data: "La Estrella de la Muerte"
)

Contact.create(
  client: homero,
  kind: 0,
  data: "max.power@speedy.com.ar"
)

Contact.create(
  client: homero,
  kind: 1,
  data: "homero.max.power"
)

Contact.create(
  client: homero,
  kind: 3,
  data: "742 de Evergreen Terrace"
)

Contact.create(
  client: bruce,
  kind: 2,
  data: "+54 221 5647895"
)

Contact.create(
  client: susy,
  kind: 0,
  data: "lasusy@hotmail.com"
)

Contact.create(
  client: mica,
  kind: 0,
  data: "mqueen@gmail.com"
)

Contact.create(
  client: mica,
  kind: 2,
  data: "+51 789-9547862"
)

Contact.create(
  client: agusto,
  kind: 0,
  data: "agusto_r@fibertel.com.ar"
)

Contact.create(
  client: lee,
  kind: 0,
  data: "lee.miyagi@yahoo.com"
)

Contact.create(
  client: lee,
  kind: 1,
  data: "lee.miyagi40"
)

#person

han = Person.create(
  kind_person: "fisica",
  name: "Han",
  surname: "Solo", 
  birthday: Date.new(1987, 9, 17),
  gender: "Masculino",
  kind_document: "DNI",
  document: 29456321,
  cuil_cuit: "20-29456321-9"
)

mirtha = Person.create(
  kind_person: "fisica",
  name: "Mirtha",
  surname: "Legrand", 
  birthday: Date.new(1750, 3, 12),
  gender: "Femenino",
  kind_document: "DNI",
  document: 1000000,
  cuil_cuit: "20-10000000-0"
)

pepe = Person.create(
  kind_person: "fisica",
  name: "Pepe",
  surname: "Argento", 
  birthday: Date.new(1960, 5, 25),
  gender: "Masculino",
  kind_document: "LE",
  document: 15258741,
  cuil_cuit: "27-15258741-1"
)

empresa_piola = Person.create(
  kind_person: "juridica",
  name: "La empresa de Piola",
  birthday: Date.new(1923, 8, 3),
  cuil_cuit: "31-56479823-9"
)

empresa_cross = Person.create(
  kind_person: "juridica",
  name: "Cross land",
  birthday: Date.new(2007, 4, 20),
  cuil_cuit: "31-24861973-9"
)

taller = Person.create(
  kind_person: "juridica",
  name: "Taller de monopatin",
  birthday: Date.new(2001, 2, 12),
  cuil_cuit: "31-85214795-9"
)

arnold = Person.create(
  kind_person: "fisica",
  name: "Arnold",
  surname: "Schwarzenegger", 
  birthday: Date.new(1947, 7, 30),
  gender: "Masculino",
  kind_document: "LC",
  document: 10325698,
  cuil_cuit: "20-10325698-8"
)

# Facturas

Invoice.create(
  description: "Una nave y deudas pendientes con el imperio",
  amount: 35700800.5,
  date: Date.new(2014, 7, 30),
  person: han,
  client: darth
)

Invoice.create(
  description: "Maquina y Mascara rejuvenecedora neptuniana",
  amount: 25711922.15,
  date: Date.new(2016, 2, 5),
  person: mirtha,
  client: darth
)

Invoice.create(
  description: "Chevy usando, algunas rayitas, impecable estado",
  amount: 250.15,
  date: Date.new(2013, 12, 5),
  person: pepe,
  client: darth
)

Invoice.create(
  description: "formol galactico, 3 containers",
  amount: 35.15,
  date: Date.new(2016, 6, 15),
  person: mirtha,
  client: darth
)

Invoice.create(
  description: "respuesto tappers de colombraro",
  amount: 160.15,
  date: Date.new(2016, 8, 12),
  person: mirtha,
  client: darth
)

Invoice.create(
  description: "mesita ratona para almuerzos, 3 banquetas",
  amount: 300.15,
  date: Date.new(2016, 4, 1),
  person: mirtha,
  client: darth
)

Invoice.create(
  description: "mesa de luz",
  amount: 3000.15,
  date: Date.new(2016, 7, 24),
  person: mirtha,
  client: darth
)

Invoice.create(
  description: "Alquiler habitacion en la Estrella de la muerte",
  amount: 300000.15,
  date: Date.new(2015, 6, 2),
  person: mirtha,
  client: darth
)

Invoice.create(
  description: "reloj pulsera, maquina de costar pasto, auto volador, jabon en polvo",
  amount: 480.25,
  date: Date.new(2015, 4, 24),
  person: pepe,
  client: darth
)

Invoice.create(
  description: "cocina electrica, repuesto para R2D2, traductor cosmico, ibupirac 600",
  amount: 1750.60,
  date: Date.new(2015, 9, 24),
  person: empresa_piola,
  client: darth
)

Invoice.create(
  description: "1 inodoro, un horno de barro, un ligthsaber azul, 1 rueda de colectivo",
  amount: 2500,
  date: Date.new(2015, 1, 21),
  person: empresa_cross,
  client: darth
)

Invoice.create(
  description: "cargador de netbook del estado, pasto artificial, 3 foquitos de luz",
  amount: 70,
  date: Date.new(2015, 10, 3),
  person: taller,
  client: darth
)

Invoice.create(
  description: "2 tiras de asado, 6 choris",
  amount: 400.55,
  date: Date.new(2015, 11, 23),
  person: mirtha,
  client: darth
)

Invoice.create(
  description: "2 tiras de asado, 6 choris",
  amount: 400.55,
  date: Date.new(2016, 10, 10),
  person: mirtha,
  client: darth
)

Invoice.create(
  description: "1 inodoro, un horno de barro, un ligthsaber azul, 1 rueda de colectivo",
  amount: 2500,
  date: Date.new(2016, 5, 13),
  person: empresa_cross,
  client: darth
)

Invoice.create(
  description: "un fiat 600, 2 turbinas",
  amount: 2500,
  date: Date.new(2016, 8, 9),
  person: arnold,
  client: darth
)

Invoice.create(
  description: "internet 6 mb",
  amount: 2500,
  date: Date.new(2012, 8, 9),
  person: han,
  client: homero
)

Invoice.create(
  description: "latas de cerveza vacias",
  amount: 100,
  date: Date.new(2012, 2, 11),
  person: mirtha,
  client: homero
)

Invoice.create(
  description: "revistas recortadas",
  amount: 90,
  date: Date.new(2012, 5, 11),
  person: mirtha,
  client: homero
)

Invoice.create(
  description: "arroz con pollo para 2",
  amount: 150,
  date: Date.new(2012, 9, 1),
  person: pepe,
  client: homero
)

Invoice.create(
  description: "limpieza con la barredora",
  amount: 300,
  date: Date.new(2012, 11, 11),
  person: empresa_piola,
  client: homero
)

Invoice.create(
  description: "reactor nuclear",
  amount: 300,
  date: Date.new(2012, 1, 23),
  person: empresa_cross,
  client: homero
)

Invoice.create(
  description: "pelos que se me cayeron",
  amount: 5000,
  date: Date.new(2016, 1, 23),
  person: empresa_piola,
  client: bruce
)

Invoice.create(
  description: "remera blanca gastada",
  amount: 75.8,
  date: Date.new(2016, 2, 20),
  person: empresa_cross,
  client: bruce
)

Invoice.create(
  description: "set de fimalacion completo",
  amount: 800500.8,
  date: Date.new(2016, 12, 20),
  person: arnold,
  client: bruce
)

Invoice.create(
  description: "foto con ricky maravilla",
  amount: 650.7,
  date: Date.new(2016, 2, 20),
  person: arnold,
  client: bruce
)

Invoice.create(
  description: "5 litros de alcohol etilico",
  amount: 1500.7,
  date: Date.new(2015, 1, 20),
  person: arnold,
  client: mica
)

Invoice.create(
  description: "100 bolsas de algodon",
  amount: 3001.7,
  date: Date.new(2015, 3, 20),
  person: arnold,
  client: mica
)

Invoice.create(
  description: "4 cajas de ibupirac 600",
  amount: 250.7,
  date: Date.new(2015, 2, 20),
  person: pepe,
  client: mica
)

Invoice.create(
  description: "2 latas de 500 curitas",
  amount: 450.75,
  date: Date.new(2015, 5, 20),
  person: empresa_cross,
  client: mica
)

Invoice.create(
  description: "1 paquete de gasas esteriles y 1 lavarropas usado",
  amount: 5250.21,
  date: Date.new(2015, 11, 20),
  person: han,
  client: mica
)

Invoice.create(
  description: "1 paquete de gasas esteriles y 2 lavarropas usado",
  amount: 11000.21,
  date: Date.new(2015, 10, 20),
  person: empresa_piola,
  client: mica
)

Invoice.create(
  description: "1 paquete de gasas esteriles y 3 caballos",
  amount: 25002.14,
  date: Date.new(2015, 4, 20),
  person: taller,
  client: mica
)
















