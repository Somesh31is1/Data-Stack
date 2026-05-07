use collegeDB

db.createCollection("student")

db.student.insertMany([
{
rollno: 1,
name: "Rahul",
city: "Pune",
course: "Computer",
marks: 85
},
{
rollno: 2,
name: "Sneha",
city: "Mumbai",
course: "IT",
marks: 92
},
{
rollno: 3,
name: "Amit",
city: "Pune",
course: "Computer",
marks: 70
},
{
rollno: 4,
name: "Priya",
city: "Delhi",
course: "ENTC",
marks: 88
},
{
rollno: 5,
name: "Karan",
city: "Pune",
course: "IT",
marks: 60
}
])

db.student.find()

db.student.find({
city: "Pune"
})

db.student.find({
$and: [
{city: "Pune"},
{marks: {$gt: 75}}
]
})

db.student.find({
$or: [
{course: "Computer"},
{marks: {$gte: 90}}
]
})

db.student.find({
marks: {
$gte: 70,
$lte: 90
}
})

db.student.find().sort({
marks: -1
})

db.student.updateOne(
{rollno: 1},
{
$set: {
marks: 95,
city: "Mumbai"
}
}
)

db.student.updateMany(
{city: "Pune"},
{
$inc: {
marks: 5
}
}
)

db.student.find()

db.student.deleteOne({
rollno: 3
})

db.student.deleteMany({
marks: {$lt: 70}
})

db.student.find()
