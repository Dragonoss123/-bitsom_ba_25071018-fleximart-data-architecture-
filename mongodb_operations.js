Operation 1:

"D:\CertificateCourse\MongoDB\mongodb-database-tools-windows-x86_64-100.14.0\mongodb-database-tools-windows-x86_64-100.14.0\bin\mongoimport.exe" --db fleximart --collection products --file "D:\CertificateCourse\Python Projects\Assignment 2\Task 2\products_catalog.json" --jsonArray


test> use fleximart
switched to db fleximart
fleximart>

Operation 2:

fleximart> db.products.find(
... {
...  category:"Electronics",
... price: {$lt:50000}
... },
... {
... _id: 0,
... name: 1,
... price: 1,
... stock: 1
... }
... )


Operation 3:

fleximart> db.products.aggregate([ { $addFields: { average_rating: {$avg:"$reviews.rating"} } }, { $match:{ average_rating:{$gte: 4.0} } }, {$project:{ _id: 0, name: 1, category: 1, average_rating: 1}}])


Operation 4:

fleximart> db.products.updateOne(
... {product_id: "ELEC001"},
... {
... $push: {
... reviews: {
... user_id: "U999",
... rating: 4,
... comment: "Good value",
... date: ISODate()
... }
... }
... })

Operation 5:

fleximart> db.products.aggregate([
... {$group:{
... _id:"$category",
... avg_price:{$avg:"$price"},
... product_count:{$sum:1}}},
... {$project:{
... _id:0,
... category:"$_id",
... avg_price:{$round:["$avg_price",2]},
... product_count:1}},
... {$sort:{avg_price:-1}}])
