console.log("hello");
// //objects
// //q1 
// let person = {
//     name: "daniel",
//     age: 20,
//     isStudent: true
// };

// console.log(person);
// //q2
// console.log(person.name, person.age);
// //q3
// person.isStudent = false;
// console.log(person);
// //q1
// let car = {
//     make: "tesla",
//     model: "s",
//     year : 2024
// };
// console.log(car.make , car.model);
//  car.year = 2023
//  console.log(car);
//  //q1
//  let friut = {
//     name:"mango",
//     color:"yellow",
//     sweetnes:7
//  };
// //q2
// console.log(friut.name, friut.sweetnes);
// //q3
// friut.color = "green"
// console.log(friut);
// //q1
// let book = {
//     title:'hasamba',
//     Author:'eli',
//     pages:200,
// }
// //q2
// console.log(book.title, book.Author);
// //q3
// book.pages += 50;
// console.log(book);
// //q1
// let animal = {
//     species:"cat",
//     sound:"meaw",
//     isWild:false
// };

// console.log(animal.species,animal.sound);
// animal.isWild = true
// console.log(animal.isWild);
//exre 1-5 done


//q1 pt
// let car = {
//     make:"toyota",
//     model:"corola",
//     year:2020,

//     PrintDetails: function carKeys() {
//         console.log(this.make ,this.model ,this.year);
   
//     }

// };
// car.PrintDetails()
// //q2
// console.log(car.model);
// //q3
// car.year = 2024;
// //q4 
// car.color = "blue";
//q5

//q6
// let carKeys = Object.keys(car);
// console.log(carKeys);
// for (let i = 0; i < carKeys.length; i++) {
//     console.log(carKeys[i]);;
//     console.log(car[carKeys[i]]);
// // };
// //q7
// let person = {
//     name: "daniel",
//     age:20,
//     city:"kfar saba"
// };
// //q8
// personKeys = Object.keys(person);
// console.log(personKeys);