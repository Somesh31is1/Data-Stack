use shopDB

db.orders.insertMany([
{
Id: 1,
name: "Rahul",
product: "Laptop",
category: "Electronics",
amt: 50000
},
{
Id: 2,
name: "Rahul",
product: "Mouse",
category: "Electronics",
amt: 2000
},
{
Id: 3,
name: "Sneha",
product: "Shoes",
category: "Fashion",
amt: 3000
},
{
Id: 4,
name: "Sneha",
product: "Bag",
category: "Fashion",
amt: 2500
},
{
Id: 5,
name: "Amit",
product: "Mobile",
category: "Electronics",
amt: 15000
}
])

var cursor = db.orders.find()

db.customer_total.drop()

while(cursor.hasNext())
{
var doc = cursor.next()

var existing = db.customer_total.findOne({name: doc.name})

if(existing)
{
db.customer_total.updateOne(
{name: doc.name},
{$inc: {totalSales: doc.amt}}
)
}
else
{
db.customer_total.insertOne({
name: doc.name,
totalSales: doc.amt
})
}
}

db.customer_total.find()
