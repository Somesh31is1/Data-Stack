use shopDB

db.orders.insertMany([
{
Id: 1,
name: "Rahul",
product: "Laptop",
category: "Electronics",
amt: 50000,
date: "2026-05-01"
},
{
Id: 2,
name: "Sneha",
product: "Mouse",
category: "Electronics",
amt: 1000,
date: "2026-05-02"
},
{
Id: 3,
name: "Amit",
product: "Shirt",
category: "Clothing",
amt: 2000,
date: "2026-05-03"
},
{
Id: 4,
name: "Priya",
product: "Jeans",
category: "Clothing",
amt: 3000,
date: "2026-05-04"
},
{
Id: 5,
name: "Karan",
product: "Rice Bag",
category: "Grocery",
amt: 2500,
date: "2026-05-05"
}
])

db.orders.aggregate([
{
$group: {
_id: "$category",
totalSales: { $sum: "$amt" },
averageAmount: { $avg: "$amt" }
}
},
{
$sort: {
totalSales: -1
}
}
])
