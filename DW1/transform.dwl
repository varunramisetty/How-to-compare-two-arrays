%dw 2.0
output application/json
import * from dw::util::Values
//imported the dw::util::Values module and creates a variable called "a" which has two values: "food" and "drinks".
var a = {
//The food value is an array of objects with each object containing information about one type of food, such as its name, type, price, etc.
 "food":[
    {
      "name":"applePie",
      "type":"dessert",
      "price":100
    },
    {
      "name":"pizza",
      "type":"italian",
      "price":370
    },
    {
      "name":"burger",
      "type":"macCheese",
      "price":310
    },
    {
      "name":"salad",
      "type":"Veg",
      "price":50
    },
 {
      "name":"Wraps",
      "type":"cheese",
      "price":150
    },
    {
      "name":"Cake",
      "type":"dessert",
      "price":45
    },
    {
      "name":"Chocolate",
      "type":"dessert",
      "price":310
    },
    {
      "name":"rice",
      "type":"Veg",
      "price":50
    }
 
  ],
  //The drinks value is also an array of objects but it contains only cold drinks like coke or coffee.
  "drinks":[
    {
      "name":"coke",
      "type":"coldDrink",
      "price":75
    },
    {
      "name":"coffee",
      "type":"hotDrink",
      "price":40
    },
    {
      "name":"tea",
      "type":"hotDrink",
      "price":35
    },
    {
      "name":"freshJuice",
      "type":"coldDrink",
      "price":50
    }
  ]
  
}
//The food value is an array of objects with each object containing information about one type of food, such as its name, type, price, etc.
 
var b = {
 "food": [
  {
   "name": "applePie",
   "type": "dessert",
   "price": 100
  },
  {
   "name": "pizza",
   "type": "italian",
   "price": 370
  },
  {
   "name": "pizza",
   "type": "italian",
   "price": 370
  }
 ],
 "drinks": [
//The drinks value is also an array of objects but it contains only cold drinks like coke or coffee.
  {
   "name": "coke",
   "type": "coldDrink",
   "price": 75
  },
  {
   "name": "coffee",
   "type": "hotDrink",
   "price": 40
  }
 ]
}
//The "food" property has five entries: 1. applePie 2. pizza 3. burger 4. salad 5.Wraps
var food = (a.food ++ b.food)
//It then declares two variables, distintFood and distintdrinks, which are used to store the distinct values of each item in their respective lists.
var distintFood= food distinctBy ((item, index) -> item)
var drinks = (a.drinks ++ b.drinks)
var distintdrinks=drinks distinctBy ((item, index) -> item)
---
{    ("food": distintFood map ((item, index) -> 
{
   "name": item.name,

   "type": if (sizeOf(b.food filter ($.name == item.name)) > 0 ) (b.food filter ($.name == item.name))[0]."type" else item."type",
   "price": if (sizeOf(b.food filter ($.name == item.name)) > 0 ) (b.food filter ($.name == item.name))[0]."price" else item."price"
})distinctBy ((item, index) -> item)),
(drinks : distintdrinks map ((item, index) -> 
{
   "name": item.name,
   "type": if (sizeOf(b.drinks filter ($.name == item.name)) > 0 ) (b.drinks filter ($.name == item.name))[0]."type" else item."type",
  "price":if (sizeOf(b.drinks filter ($.name == item.name)) > 0 ) (b.drinks filter ($.name == item.name))[0].price else item.price
 
}) distinctBy ((item, index) -> item))}
//in the above function im trying to get the values which are similary in a and b and if are different b will replaces with a values fo that im using if else function and sizeOf